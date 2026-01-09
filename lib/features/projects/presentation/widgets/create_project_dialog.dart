import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/error_messages.dart';
import '../bloc/project_bloc.dart';

class CreateProjectDialog extends StatefulWidget {
  const CreateProjectDialog({super.key});

  @override
  State<CreateProjectDialog> createState() => _CreateProjectDialogState();
}

class _CreateProjectDialogState extends State<CreateProjectDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _dueDate;
  String _colorCode = '#FFC107';

  final List<String> _colors = [
    '#FFC107', // Yellow (primary)
    '#6366F1', // Indigo
    '#EC4899', // Pink
    '#10B981', // Emerald
    '#3B82F6', // Blue
    '#8B5CF6', // Violet
    '#EF4444', // Red
    '#06B6D4', // Cyan
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return BlocListener<ProjectBloc, ProjectState>(
      listener: (context, state) {
        state.whenOrNull(
          projectCreated: (project) {
            Navigator.pop(context);
            showFToast(
              context: context,
              icon: const Icon(FIcons.check),
              title: Text('Project "${project.title}" created!'),
              duration: const Duration(seconds: 3),
            );
            context.read<ProjectBloc>().add(const ProjectEvent.loadProjects());
          },
          error: (failure) {
            showFToast(
              context: context,
              icon: const Icon(FIcons.triangleAlert),
              title: Text(ErrorMessages.fromProjectFailure(failure)),
              duration: const Duration(seconds: 4),
            );
          },
        );
      },
      child: Dialog(
        backgroundColor: colors.backgroundCard,
        shape: RoundedRectangleBorder(borderRadius: .circular(20)),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const .all(24),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        'Create Project',
                        style: context.theme.typography.xl.copyWith(
                          fontWeight: .bold,
                          color: colors.textPrimary,
                        ),
                      ),
                      FTappable(
                        onPress: () => Navigator.pop(context),
                        child: Icon(
                          FIcons.x,
                          color: colors.textSecondary,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Project Name',
                    style: context.theme.typography.sm.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FTextField(
                    control: FTextFieldControl.managed(
                      controller: _titleController,
                    ),
                    hint: 'Enter project name',
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Description (optional)',
                    style: context.theme.typography.sm.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FTextField(
                    control: FTextFieldControl.managed(
                      controller: _descriptionController,
                    ),
                    hint: 'Enter project description',
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Color',
                    style: context.theme.typography.sm.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: _colors.map((color) {
                      final isSelected = color == _colorCode;
                      return FTappable(
                        onPress: () => setState(() => _colorCode = color),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: AppUtils.parseColor(color),
                            shape: .circle,
                            border: isSelected
                                ? .all(color: colors.textPrimary, width: 3)
                                : null,
                          ),
                          child: isSelected
                              ? const Icon(
                                  FIcons.check,
                                  color: Colors.white,
                                  size: 20,
                                )
                              : null,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  FTappable(
                    onPress: _selectDueDate,
                    child: Container(
                      padding: const .all(16),
                      decoration: BoxDecoration(
                        color: colors.backgroundSecondary,
                        borderRadius: .circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            FIcons.calendar,
                            color: colors.textSecondary,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              _dueDate == null
                                  ? 'Add due date'
                                  : '${_dueDate!.day}/${_dueDate!.month}/${_dueDate!.year}',
                              style: context.theme.typography.sm.copyWith(
                                color: _dueDate == null
                                    ? colors.textSecondary
                                    : colors.textPrimary,
                              ),
                            ),
                          ),
                          if (_dueDate != null)
                            FTappable(
                              onPress: () => setState(() => _dueDate = null),
                              child: Icon(
                                FIcons.x,
                                color: colors.textSecondary,
                                size: 18,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: FButton(
                          onPress: () => Navigator.pop(context),
                          style: FButtonStyle.outline(),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: BlocBuilder<ProjectBloc, ProjectState>(
                          builder: (context, state) {
                            final isLoading = state.maybeWhen(
                              loading: () => true,
                              orElse: () => false,
                            );

                            return FButton(
                              onPress: isLoading ? null : _submit,
                              child: isLoading
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: AppTheme.backgroundDark,
                                      ),
                                    )
                                  : const Text('Create'),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDueDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (date != null) {
      setState(() => _dueDate = date);
    }
  }

  void _submit() {
    if (_titleController.text.trim().isEmpty) {
      showFToast(
        context: context,
        icon: const Icon(FIcons.triangleAlert),
        title: const Text('Please enter a project name'),
        duration: const Duration(seconds: 4),
      );
      return;
    }

    context.read<ProjectBloc>().add(
      ProjectEvent.createProject(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        dueDate: _dueDate,
        colorCode: _colorCode,
      ),
    );
  }
}
