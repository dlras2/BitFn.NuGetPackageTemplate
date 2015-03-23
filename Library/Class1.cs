using Humanizer;

namespace BitFn.CoreUtilities.ProjectTemplate
{
	public class Class1
	{
		public string Echo(string argument)
		{
			return string.Format("{0}: {1}", nameof(argument).Humanize(), argument);
		}
	}
}