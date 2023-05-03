part of 'theme_bloc.dart';

class ThemeEvent extends Equatable {
  final AppTheme theme;

  const ThemeEvent({required this.theme});

  @override
  List<Object?> get props => [theme];
}
