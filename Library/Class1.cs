using System;
using System.Diagnostics.Contracts;
using Humanizer;

namespace BitFn.NuGetPackageTemplate
{
	/// <summary>
	///     A class this library wants to expose.
	/// </summary>
	public class Class1
	{
		private readonly IInterface1 _interface1;

		/// <summary>
		///     A dummy-class for testing project setup.
		/// </summary>
		/// <param name="interface1"></param>
		public Class1(IInterface1 interface1)
		{
			_interface1 = interface1;
		}

		/// <summary>
		///     A method echoing its arguments.
		/// </summary>
		/// <param name="argument">The string to echo.</param>
		/// <returns>The argument string, preceded by its argument name.</returns>
		public string Echo(string argument)
		{
			return $"{nameof(argument).Humanize()}: {argument}";
		}

		/// <summary>
		///     A method echoing its arguments if it's not null.
		/// </summary>
		/// <param name="argument">The non-null string to echo.</param>
		/// <returns>The argument string, preceded by its argument name.</returns>
		public string EchoNotNull(string argument)
		{
			Contract.Requires<ArgumentNullException>(argument != null);

			return $"{nameof(argument).Humanize()}: {argument}";
		}
	}
}