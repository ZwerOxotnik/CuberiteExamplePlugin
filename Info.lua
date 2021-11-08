
-- Info.lua (https://api.cuberite.org/InfoFile.html)

-- Implements the g_PluginInfo standard plugin description

g_PluginInfo =
{
	Name = "CuberiteExamplePlugin",
  Version = 3,
	Date = "2021-11-06",
	SourceLocation = "https://github.com/ZwerOxotnik/CuberiteExamplePlugin",
	Description = "[Unofficial][WIP] This is an example plugin to get you comfortable with Cuberite plugins etc",
	AdditionalInfo = {},
	Commands = {
    ["/checkMessages"] =
    {
      Permission = "CuberiteExamplePlugin.checkMessages",
      Handler = HandleCheckMessagesCommand,
      HelpString = "Prints various test messages.",
    },
  },
	ConsoleCommands = {
    ["checkMessages"] =
		{
			Handler =  HandleConsoleCheckMessages,
			HelpString = "Prints various test messages.",
		},
  },
	Permissions = {
    ["CuberiteExamplePlugin.checkMessages"] =
		{
			Description = "Allows players to print test messages.",
			RecommendedGroups = "Default",
		},
  },
	Categories = {},
}
