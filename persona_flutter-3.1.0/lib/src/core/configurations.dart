import '../core/enums.dart';
import 'theme.dart';

/// Base classe to all inquiry configurations
abstract class InquiryConfiguration {
  InquiryConfiguration({
    this.theme,
  });

  /// Inquiry themes control the look and feel of a given flow.
  /// Set theme source to [server] to be configurable in the Persona dashboard.
  final InquiryTheme? theme;

  Map<String, dynamic> toJson();
}

/// Base classe to template configuration objects
class _BaseTemplateConfiguration extends InquiryConfiguration {
  _BaseTemplateConfiguration({
    this.accountId,
    this.referenceId,
    required this.environment,
    required this.fields,
    InquiryTheme? theme,
  }) : super(theme: theme);

  /// The account to associate this inquiry with. The account can be used to monitor user progress in newly created inquiries.
  final String? accountId;

  /// The identifier can be used to monitor user progress in newly created inquiries.
  final String? referenceId;

  /// The environment on which to create inquiries.
  final String? environment;

  /// Any existing user data you want to attach to the inquiry.
  final Map<String, dynamic> fields;

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

/// Configuration object used for creating an inquiry using a template version
class TemplateVersionConfiguration extends _BaseTemplateConfiguration {
  TemplateVersionConfiguration({
    required this.templateVersion,
    String? accountId,
    String? referenceId,
    String? environment = "sandbox",
    Map<String, dynamic> fields = const {},
    InquiryTheme? theme,
  }) : super(
            accountId: accountId,
            referenceId: referenceId,
            environment: environment,
            fields: fields,
            theme: theme);

  /// An existing template version that determines how the flow is customized.
  final String templateVersion;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'templateVersion': templateVersion,
      'accountId': accountId,
      'referenceId': referenceId,
      'environment': environment,
      'fields': fields,
      'theme': theme?.toJson(),
    };
  }
}

/// Configuration object used for creating an inquiry using a template version
class TemplateIdConfiguration extends _BaseTemplateConfiguration {
  TemplateIdConfiguration({
    required this.templateId,
    String? accountId,
    String? referenceId,
    String? environment = "sandbox",
    Map<String, dynamic> fields = const {},
    InquiryTheme? theme,
  }) : super(
            accountId: accountId,
            referenceId: referenceId,
            environment: environment,
            fields: fields,
            theme: theme);

  /// An existing template id that determines how the flow is customized.
  final String templateId;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'templateId': templateId,
      'accountId': accountId,
      'referenceId': referenceId,
      'environment': environment,
      'fields': fields,
      'theme': theme?.toJson(),
    };
  }
}

/// Configuration object used for creating an Inquiry using an inquiry ID.
class InquiryIdConfiguration extends InquiryConfiguration {
  InquiryIdConfiguration({
    required this.inquiryId,
    this.sessionToken,
    InquiryTheme? theme,
  }) : super(theme: theme);

  /// An existing inquiry.
  final String inquiryId;

  /// Session token for resuming an Inquiry. The token must be generated on the server.
  final String? sessionToken;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'inquiryId': inquiryId,
      'sessionToken': sessionToken,
      'theme': theme?.toJson(),
    };
  }
}
