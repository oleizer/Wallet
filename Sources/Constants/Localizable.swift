// swiftlint:disable all
// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {

  internal enum Common {
    /// Отмена
    internal static let cancel = L10n.tr("Localizable", "Common.Cancel")
    /// Выход
    internal static let logout = L10n.tr("Localizable", "Common.Logout")
    /// Ок
    internal static let ok = L10n.tr("Localizable", "Common.Ok")
  }

  internal enum Welcome {
    internal enum Buttons {
      /// Восстановить с паролем
      internal static let `import` = L10n.tr("Localizable", "Welcome.Buttons.import")
      /// Создать новый кошелёк
      internal static let new = L10n.tr("Localizable", "Welcome.Buttons.new")
    }
    internal enum Import {
      /// JSON ключа
      internal static let json = L10n.tr("Localizable", "Welcome.Import.json")
      /// Фразы восстановления
      internal static let mnemonic = L10n.tr("Localizable", "Welcome.Import.mnemonic")
      /// Приватного ключа
      internal static let `private` = L10n.tr("Localizable", "Welcome.Import.private")
      /// Восстановить с помощью
      internal static let subtitle = L10n.tr("Localizable", "Welcome.Import.subtitle")
      /// Восстановить
      internal static let title = L10n.tr("Localizable", "Welcome.Import.title")
    }
    internal enum Labels {
      /// Начните с создания нового кошелька или восстановления существующего
      internal static let subtitle = L10n.tr("Localizable", "Welcome.Labels.subtitle")
      /// MVO Wallet
      internal static let title = L10n.tr("Localizable", "Welcome.Labels.title")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
