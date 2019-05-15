const generateTheme = (
  themeName,
  {
    black,
    blacklight,
    blackout,
    white,
    white77,
    white33,
    cyan,
    blue,
    blue77,
    blue33,
    magenta,
    magenta22,
    magenta77,
    magenta33,
    magentaMuted,
    red,
    green,
    green77,
    green33,
    yellow
  }
) => ({
  name: "Jellyfish",
  type: "dark",
  colors: {
    backgorund: black,
    foreground: white,
    "widget.shadow": black,
    "selection.background": magenta33,
    descriptionForeground: white,
    "editor.background": black,
    "editor.foreground": white,
    "editor.hoverHighlightBackground": blackout,
    "editorWidget.background": black,
    "editorWidget.border": magenta33,
    "editorMarkerNavigation.background": black,
    "editorMarkerNavigationError.background": red,
    "editorMarkerNavigationWarning.background": yellow,
    "editorMarkerNavigationInfo.background": blue,
    "merge.currentHeaderBackground": green77,
    "merge.currentContentBackground": green33,
    "merge.incomingHeaderBackground": blue77,
    "merge.incomingContentBackground": blue33,
    "merge.commonContentBackground": black,
    "merge.commonHeaderBackground": black,
    "editorSuggestWidget.background": black,
    "editorSuggestWidget.foreground": white,
    "editorSuggestWidget.highlightForeground": magenta,
    "editorSuggestWidget.selectedBackground": black,
    "menubar.selectionForeground": magenta,
    "menubar.selectionBackground": black,
    "menu.foreground": white,
    "menu.background": black,

    "pickerGroup.foreground": white,
    "list.highlightForeground": magenta,

    "menu.selectionBorder": magenta,
    "notificationCenter.border": magenta77,
    "notificationCenterHeader.foreground": magenta,
    "notificationCenterHeader.background": black,
    "notificationToast.border": magenta77,
    "notifications.foreground": white,
    "notifications.background": black,
    "notificationLink.foreground": blue,
    "activityBar.background": black,
    errorForeground: red,
    "button.background": blue,
    "button.foreground": white,
    "textBlockQuote.background": red,
    "activityBarBadge.background": white,
    "activityBarBadge.foreground": black,
    "activityBar.foreground": magenta,
    "activityBar.inactiveForeground": white77,
    "scrollbarSlider.activeBackground": magenta,
    "scrollbarSlider.background": magenta33,
    "scrollbarSlider.hoverBackground": magenta77,
    "editorGroupHeader.tabsBackground": black,
    "editorGutter.background": black,
    "editorGutter.addedBackground": green,
    "editorGutter.modifiedBackground": magenta,
    "editorGutter.deletedBackground": red,
    "badge.foreground": magenta,
    "progressBar.background": magenta,
    "badge.background": black,
    "list.inactiveSelectionBackground": magenta33,
    "list.inactiveSelectionForeground": white,
    "list.activeSelectionBackground": magenta33,
    "list.activeSelectionForeground": white,
    "sideBarTitle.foreground": magenta,
    "sideBarSectionHeader.border": magenta33,
    "editorGroup.emptyBackground": black,
    "sideBarSectionHeader.background": black,
    "sideBarSectionHeader.foreground": magenta,
    "editorLineNumber.foreground": white77,
    "sideBar.border": magenta33,
    "editorLineNumber.activeForeground": white,
    foreground: white,
    focusBorder: magenta77,
    "input.placeholderForeground": white77,
    "scrollbar.shadow": black,
    "input.background": blackout,
    "input.foreground": white,
    "inputOption.activeBorder": magenta,
    "statusBar.background": black,
    "statusBar.foreground": white,
    "sideBar.background": black,
    "breadcrumb.foreground": white,
    "breadcrumb.background": black,
    "breadcrumbPicker.background": black,
    "breadcrumb.focusForeground": magenta,
    "breadcrumb.activeSelectionForeground": magenta,
    "gitDecoration.addedResourceForeground": green,
    "diffEditor.insertedTextBackground": `${green}11`,
    "diffEditor.removedTextBackground": `${red}11`,
    "diffEditor.border": magenta77,
    "gitDecoration.modifiedResourceForeground": magenta,
    "gitDecoration.deletedResourceForeground": red,
    "sideBarTitle.foreground": white,
    "editor.rangeHighlightBackground": magenta33,
    "editorCodeLens.foreground": magenta,
    "editor.selectionBackground": magenta22,
    "panel.background": black,
    "panel.border": magenta33,
    "editorIndentGuide.background": white33,
    "editorIndentGuide.activeBackground": magenta77,
    "editorRuler.foreground": magenta33,
    "editorOverviewRuler.border": magenta33,
    "editorOverviewRuler.findMatchForeground": magenta77,
    "editor.selectionHighlightBackground": magenta33,
    "panelTitle.activeForeground": white,
    "editorOverviewRuler.addedForeground": green,
    "editorOverviewRuler.modifiedForeground": magenta,
    "editorOverviewRuler.warningForeground": yellow,
    "editorOverviewRuler.infoForeground": blue77,
    "editorOverviewRuler.deletedForeground": red,
    "editorOverviewRuler.errorForeground": red,
    "editor.selectionHighlightBorder": magenta77,
    "panelTitle.inactiveForeground": white,
    "editorOverviewRuler.bracketMatchForeground": magenta,
    "editorError.foreground": red,
    "editorWarning.foreground": yellow,
    "editorInfo.foreground": blue,
    "editorHint.foreground": magenta,
    "editorUnnecessaryCode.border": red,
    "editor.wordHighlightBackground": magenta33,
    "editor.wordHighlightStrongBackground": magenta33,
    "editor.wordHighlightBorder": magenta77,
    "list.focusBackground": blacklight,
    "list.focusForeground": white,
    "statusBar.noFolderBackground": black,
    "statusBar.noFolderForeground": white,
    "statusBar.debuggingBorder": red,
    "debugToolBar.background": red,
    "settings.headerForeground": white,
    "settings.modifiedItemIndicator": magenta,
    "settings.dropdownBackground": black,
    "settings.dropdownForeground": white,
    "settings.dropdownBorder": magenta33,
    "settings.checkboxBackground": black,
    "settings.checkboxForeground": white,
    "settings.checkboxBorder": magenta33,
    "settings.textInputBackground": black,
    "settings.textInputForeground": white,
    "settings.textInputBorder": magenta33,
    "settings.numberInputBackground": black,
    "settings.numberInputForeground": white,
    "settings.numberInputBorder": magenta33,
    "statusBar.debuggingForeground": black,
    "editorBracketMatch.background": black,
    "editor.findMatchHighlightBackground": magenta33,
    "list.hoverBackground": blacklight,
    "list.hoverForeground": magenta,
    "editor.findRangeHighlightBackground": magenta33,
    "editorBracketMatch.border": magenta77,
    "editor.findMatchBackground": magenta33,
    "peekViewEditorGutter.background": black,
    "peekViewTitle.background": black,
    "peekViewTitleDescription.foreground": white,
    "peekViewTitleLabel.foreground": magenta,
    "peekViewResult.background": black,
    "peekViewResult.matchHighlightBackground": magenta33,
    "peekViewResult.fileForeground": white,
    "peekViewResult.lineForeground": white77,
    "peekViewResult.selectionBackground": magenta33,
    "peekViewResult.selectionForeground": white,
    "peekViewEditor.matchHighlightBackground": magenta33,
    "peekViewEditor.matchHighlightBorder": black,
    "peekViewResult.background": black,
    "tab.activeBackground": black,
    "tab.activeForeground": white,
    "peekView.border": magenta33,
    "peekViewEditor.background": black,
    "textCodeBlock.background": black,
    "textPreformat.foreground": magenta,
    "tab.border": magenta33,
    "tab.activeBorder": magenta,
    "tab.inactiveBackground": black,
    "tab.inactiveForeground": white77,
    "terminal.background": black,
    "terminal.foreground": white,
    "terminal.ansiBlack": black,
    "terminal.ansiBlue": blue,
    "terminal.ansiRed": red,
    "terminal.ansiGreen": green,
    "terminal.ansiYellow": yellow,
    "terminal.ansiMagenta": magenta,
    "terminal.ansiCyan": cyan,
    "terminal.ansiWhite": white,
    "textLink.foreground": magenta,
    "textLink.activeForeground": magenta,
    "textPreformat.foreground": white,
    "titleBar.activeBackground": black,
    "titleBar.activeForeground": white,
    "titleBar.inactiveForeground": white77
  },
  tokenColors: [
    {
      name: "Comment",
      scope: ["comment", "punctuation.definition.comment"],
      settings: {
        fontStyle: "italic",
        foreground: magenta77
      }
    },
    {
      name: "Variables",
      scope: ["variable", "string constant.other.placeholder"],
      settings: {
        foreground: cyan
      }
    },
    {
      name: "Colors",
      scope: ["constant.other.color"],
      settings: {
        foreground: white
      }
    },
    {
      name: "Invalid",
      scope: ["invalid", "invalid.illegal"],
      settings: {
        foreground: red
      }
    },
    {
      name: "Keyword, Storage",
      scope: ["keyword", "storage.type", "storage.modifier"],
      settings: {
        foreground: magenta
      }
    },
    {
      name: "Punctuation",
      scope: "string.quoted punctuation",
      settings: {
        foreground: green
      }
    },
    {
      name: "Operator, Misc",
      scope: [
        "keyword.control",
        "constant.other.color",
        "meta.tag",
        "punctuation.definition.tag",
        "punctuation.separator.inheritance.php",
        "punctuation.definition.tag.html",
        "punctuation.definition.tag.begin.html",
        "punctuation.definition.tag.end.html",
        "punctuation.section.embedded",
        "keyword.other.template",
        "keyword.other.substitution"
      ],
      settings: {
        foreground: white
      }
    },
    {
      name: "JS - Import/Require",
      scope: ["keyword.control.module.js"],
      settings: {
        foreground: magenta
      }
    },
    {
      name: "JS  - Object Property Keys",
      scope: "string.unquoted.js",
      settings: {
        foreground: white
      }
    },
    {
      name: "JS - Object Property Strings",
      scope: [
        "constant.other.object.key.js string.quoted.double.js",
        "constant.other.object.key.js string.quoted punctuation"
      ],
      settings: {
        foreground: magenta
      }
    },
    {
      name: "Tag",
      scope: ["entity.name.tag", "meta.tag.sgml", "markup.deleted.git_gutter"],
      settings: {
        foreground: red
      }
    },
    {
      name: "Function Call",
      scope: ["meta.function-call"],
      settings: {
        foreground: white
      }
    },
    {
      name: "Function, Special Method",
      scope: [
        "entity.name.function",
        "variable.function",
        "support.function",
        "keyword.other.special-method"
      ],
      settings: {
        foreground: blue
      }
    },
    {
      name: "Block Level Variables",
      scope: ["meta.block variable.other"],
      settings: {
        foreground: white
      }
    },
    {
      name: "Other Variable, String Link",
      scope: ["support.other.variable", "string.other.link"],
      settings: {
        foreground: magenta
      }
    },
    {
      name: "Number, Constant, Function Argument, Tag Attribute, Embedded",
      scope: [
        "constant.numeric",
        "constant.language",
        "support.constant",
        "constant.character",
        "constant.escape",
        "variable.parameter",
        "keyword.other.unit",
        "keyword.other"
      ],
      settings: {
        foreground: magenta
      }
    },
    {
      name: "String, Symbols, Inherited Class, Markup Heading",
      scope: [
        "string.quoted",
        "string.quoted punctuation",
        "constant.other.symbol",
        "constant.other.key",
        "entity.other.inherited-class",
        "markup.heading",
        "markup.inserted.git_gutter",
        "meta.group.braces.curly constant.other.object.key.js string.unquoted.label.js"
      ],
      settings: {
        foreground: green
      }
    },
    {
      name: "Class, Support",
      scope: [
        "entity.name",
        "support.type",
        "support.class",
        "support.orther.namespace.use.php",
        "meta.use.php",
        "support.other.namespace.php",
        "markup.changed.git_gutter",
        "support.type.sys-types"
      ],
      settings: {
        foreground: magenta
      }
    },
    {
      name: "Entity Types",
      scope: ["support.type"],
      settings: {
        foreground: magenta
      }
    },
    {
      name: "CSS Class and Support",
      scope: [
        "source.css support.type.property-name",
        "source.sass support.type.property-name",
        "source.scss support.type.property-name",
        "source.less support.type.property-name",
        "source.stylus support.type.property-name",
        "source.postcss support.type.property-name"
      ],
      settings: {
        foreground: "#B2CCD6"
      }
    },
    {
      name: "Sub-methods",
      scope: [
        "entity.name.module.js",
        "variable.import.parameter.js",
        "variable.other.class.js"
      ],
      settings: {
        foreground: "#FF5370"
      }
    },
    {
      name: "Language methods",
      scope: ["variable.language"],
      settings: {
        fontStyle: "italic",
        foreground: "#FF5370"
      }
    },
    {
      name: "entity.name.method.js",
      scope: ["entity.name.method.js"],
      settings: {
        fontStyle: "italic",
        foreground: magenta
      }
    },
    {
      name: "meta.method.js",
      scope: [
        "meta.class-method.js entity.name.function.js",
        "variable.function.constructor"
      ],
      settings: {
        foreground: magenta
      }
    },
    {
      name: "Attributes",
      scope: ["entity.other.attribute-name"],
      settings: {
        foreground: "#C792EA"
      }
    },
    {
      name: "HTML Attributes",
      scope: [
        "text.html.basic entity.other.attribute-name.html",
        "text.html.basic entity.other.attribute-name"
      ],
      settings: {
        fontStyle: "italic",
        foreground: "#FFCB6B"
      }
    },
    {
      name: "CSS Classes",
      scope: ["entity.other.attribute-name.class"],
      settings: {
        foreground: "#FFCB6B"
      }
    },
    {
      name: "CSS ID's",
      scope: ["source.sass keyword.control"],
      settings: {
        foreground: "#82AAFF"
      }
    },
    {
      name: "Inserted",
      scope: ["markup.inserted"],
      settings: {
        foreground: "#C3E88D"
      }
    },
    {
      name: "Deleted",
      scope: ["markup.deleted"],
      settings: {
        foreground: "#FF5370"
      }
    },
    {
      name: "Changed",
      scope: ["markup.changed"],
      settings: {
        foreground: "#C792EA"
      }
    },
    {
      name: "Regular Expressions",
      scope: ["string.regexp"],
      settings: {
        foreground: "#89DDFF"
      }
    },
    {
      name: "Escape Characters",
      scope: ["constant.character.escape"],
      settings: {
        foreground: "#89DDFF"
      }
    },
    {
      name: "URL",
      scope: ["*url*", "*link*", "*uri*"],
      settings: {
        fontStyle: "underline"
      }
    },
    {
      name: "Decorators",
      scope: [
        "tag.decorator.js entity.name.tag.js",
        "tag.decorator.js punctuation.definition.tag.js"
      ],
      settings: {
        fontStyle: "italic",
        foreground: "#82AAFF"
      }
    },
    {
      name: "ES7 Bind Operator",
      scope: [
        "source.js constant.other.object.key.js string.unquoted.label.js"
      ],
      settings: {
        fontStyle: "italic",
        foreground: "#FF5370"
      }
    },
    {
      name: "[VSCODE-CUSTOM] JSON Property Name",
      scope: [
        "support.type.property-name.json",
        "punctuation.support.type.property-name"
      ],
      settings: {
        foreground: magenta,
        fontStyle: "italic"
      }
    },
    {
      name: "[VSCODE-CUSTOM] JSON constants",
      scope: "constant.language.json",
      settings: {
        foreground: white,
        fontStyle: "italic"
      }
    },
    {
      name: "[VSCODE-CUSTOM] JSON Property Value",
      scope: [
        "string.quoted.double.json",
        "string.quoted.double.json punctuation"
      ],
      settings: {
        foreground: green
      }
    },
    {
      name: "[JSONNET] JSON String Double Quoted",
      scope: "string.quoted.double.jsonnet",
      settings: {
        foreground: magenta
      }
    },
    {
      name: "Markdown - Plain",
      scope: [
        "text.html.markdown",
        "punctuation.definition.list_item.markdown"
      ],
      settings: {
        foreground: white
      }
    },
    {
      name: "Markdown - Markup Raw Inline",
      scope: ["text.html.markdown markup.inline.raw.markdown"],
      settings: {
        foreground: magenta
      }
    },
    {
      name: "Markdown - Markup Raw Inline Punctuation",
      scope: [
        "text.html.markdown markup.inline.raw.markdown punctuation.definition.raw.markdown"
      ],
      settings: {
        foreground: white
      }
    },
    {
      name: "Markdown - Heading",
      scope: "markup.heading",
      settings: {
        foreground: magenta
      }
    },
    {
      name: "Markup - Italic",
      scope: ["markup.italic"],
      settings: {
        fontStyle: "italic",
        foreground: white
      }
    },
    {
      name: "Markup - Bold",
      scope: ["markup.bold", "markup.bold string"],
      settings: {
        fontStyle: "bold",
        foreground: white
      }
    },
    {
      name: "Boolean",
      scope: "constant.language.boolean",
      settings: {
        foreground: white
      }
    },
    {
      name: "Markup - Bold-Italic",
      scope: [
        "markup.bold markup.italic",
        "markup.italic markup.bold",
        "markup.quote markup.bold",
        "markup.bold markup.italic string",
        "markup.italic markup.bold string",
        "markup.quote markup.bold string"
      ],
      settings: {
        fontStyle: "bold",
        foreground: white
      }
    },
    {
      name: "Markup - Underline",
      scope: ["markup.underline"],
      settings: {
        fontStyle: "underline",
        foreground: white
      }
    },
    {
      name: "Markdown - Blockquote",
      scope: ["markup.quote punctuation.definition.blockquote.markdown"],
      settings: {
        foreground: magenta
      }
    },
    {
      name: "Markup - Quote",
      scope: ["markup.quote"],
      settings: {
        fontStyle: "italic"
      }
    },
    {
      name: "Markdown - Link",
      scope: ["string.other.link.title.markdown"],
      settings: {
        foreground: blue
      }
    },
    {
      name: "Markdown - Link Description",
      scope: ["string.other.link.description.title.markdown"],
      settings: {
        foreground: white
      }
    },
    {
      name: "Markdown - Link Anchor",
      scope: ["constant.other.reference.link.markdown"],
      settings: {
        foreground: white
      }
    },
    {
      name: "Markup - Raw Block",
      scope: ["markup.raw.block"],
      settings: {
        foreground: white
      }
    },
    {
      name: "Markdown - Raw Block Fenced",
      scope: ["markup.raw.block.fenced.markdown"],
      settings: {
        foreground: white
      }
    },
    {
      name: "Markdown - Fenced Bode Block",
      scope: ["punctuation.definition.fenced.markdown"],
      settings: {
        foreground: white
      }
    },
    {
      name: "Markdown - Fenced Bode Block Variable",
      scope: [
        "markup.raw.block.fenced.markdown",
        "variable.language.fenced.markdown",
        "punctuation.section.class.end"
      ],
      settings: {
        foreground: white
      }
    },
    {
      name: "Markdown - Fenced Language",
      scope: ["variable.language.fenced.markdown"],
      settings: {
        foreground: white
      }
    },
    {
      name: "Markdown - Separator",
      scope: ["meta.separator"],
      settings: {
        fontStyle: "bold",
        foreground: white
      }
    },
    {
      name: "Markup - Table",
      scope: ["markup.table"],
      settings: {
        foreground: white
      }
    },
    {
      name: "Makefile - Target Name",
      scope: "entity.name.function.target.makefile",
      settings: {
        foreground: magenta
      }
    }
  ]
});

module.exports = generateTheme;
