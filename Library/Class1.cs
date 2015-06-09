using Humanizer;

namespace BitFn.CoreUtilities.ProjectTemplate
{
	public class Class1
	{
		private readonly IInterface1 _interface1;

		public Class1(IInterface1 interface1)
		{
			_interface1 = interface1;
		}

		public string Echo(string argument)
		{
			return $"{nameof(argument).Humanize()}: {argument}";
		}
	}
}