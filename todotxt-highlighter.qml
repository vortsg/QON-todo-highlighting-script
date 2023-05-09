import QtQml 2.0
import QOwnNotesTypes 1.0

/*
Highlighter for todo.txt syntax
*/

QtObject {
	property string stylePriority;
	property string styleCompletionDate;
	property string styleCreationDate;
	property string styleProject;
	property string styleContext;
	property string styleDueDate;
	property string styleRecurring;
	property string styleInProgress;
    property var qownStyles: {
					"-1": "NoState",
					"0": "Link",
					"3": "Image",
					"4": "CodeBlock",
					"5": "CodeBlockComment",
					"7": "Italic",
					"8": "Bold",
					"9": "List",
					"11": "Comment",
					"12": "H1",
					"13": "H2",
					"14": "H3",
					"15": "H4",
					"16": "H5",
					"17": "H6",
					"18": "BlockQuote",
					"21": "HorizontalRuler",
					"22": "Table",
					"23": "InlineCodeBlock",
					"24": "MaskedSyntax",
					"25": "CurrentLineBackgroundColor",
					"26": "BrokenLink",
					"27": "FrontmatterBlock",
					"28": "TrailingSpace",
					"29": "CheckBoxUnChecked",
					"30": "CheckBoxChecked",
					"31": "StUnderline"
			};

	property var settingsVariables: [
		{
			"identifier": "stylePriority",
			"name": "Highlight style for Priority assignment",
			"description": "Please select a style for the Priority assignment",
			"type": "selection",
			"default": "17",
			"items": qownStyles
		},
		{
			"identifier": "styleCreationDate",
			"name": "Highlight style for Creation Date",
			"description": "Please select a style for the highlight for Creation Date",
			"type": "selection",
			"default": "11",
			"items": qownStyles
		},
		{
			"identifier": "styleCompletionDate",
			"name": "Highlight style for Completion Date",
			"description": "Please select a style for the highlight for Completion Date",
			"type": "selection",
			"default": "7",
			"items": qownStyles
		},
        {
			"identifier": "styleProject",
			"name": "Highlight style for Project",
			"description": "Please select a style for the highlight for Project",
			"type": "selection",
			"default": "8",
			"items": qownStyles
		},
        {
			"identifier": "styleContext",
			"name": "Highlight style for Context",
			"description": "Please select a style for the highlight for Context",
			"type": "selection",
			"default": "9",
			"items": qownStyles
        },
		{
			"identifier": "styleDueDate",
			"name": "Highlight style for Due Date",
			"description": "Please select a style for the highlight for Due Date",
			"type": "selection",
			"default": "30",
			"items": qownStyles
		},
        {
			"identifier": "styleRecurring",
			"name": "Highlight style for Recurring frequency",
			"description": "Please select a style for the highlight for Recurring frequency",
			"type": "selection",
			"default": "11",
			"items": qownStyles
	    },
		{
			"identifier": "styleInProgress",
			"name": "Highlight style for todos currently being worked",
			"description": "Please select a style for the highlight for In Progress tasks",
			"type": "selection",
			"default": "30",
			"items": qownStyles
		}
	];
        

    function init() {
        script.addHighlightingRule("((19|2[0-9])[0-9]{2,2})-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])", "", parseInt(styleCreationDate), 0, -1);
        script.addHighlightingRule("((19x|2x[0-9])[0-9]{2,2})-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])", "", parseInt(styleCompletionDate), 0, -1);
        script.addHighlightingRule("due:((19|2[0-9])[0-9]{2,2})-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])", "", parseInt(styleDueDate), 0, -1);
        script.addHighlightingRule("\\+(\\S+)", "", parseInt(styleProject), 0, -1);
        script.addHighlightingRule("@(\\S+)", "", parseInt(styleContext), 0, -1);
        script.addHighlightingRule("^\\(([A-Z])\\)", "", parseInt(stylePriority), 0, -1);
        script.addHighlightingRule("<(\\S*?)[^>]>.?<\\1>|<.*?>", "", parseInt(styleInProgress), 0, -1);
    }
}
