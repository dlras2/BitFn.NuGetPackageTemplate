using System;
using NUnit.Framework;

namespace BitFn.NuGetPackageTemplate.Tests
{
	[TestFixture]
	public class UnitTest1
	{
		[Test]
		public void TestMethod()
		{
		}

		[Test, MoqData]
		public void MoqDataTestMethod(Guid guid, Class1 sut)
		{
			var expected = "Argument: " + guid;
			var actual = sut.Echo(guid.ToString());
			Assert.AreEqual(expected, actual);
		}

		[Test]
		[MoqTestCase("string 1")]
		[MoqTestCase("string 2")]
		public void MoqTestCaseTestMethod(string s, Class1 sut)
		{
			var expected = "Argument: " + s;
			var actual = sut.Echo(s);
			Assert.AreEqual(expected, actual);
		}

		[Test, MoqData, ExpectedException(typeof(ArgumentNullException))]
		public void ContractsTestCaseMethod(Class1 sut)
		{
			var s = null as string;
			// ReSharper disable once ExpressionIsAlwaysNull
			sut.EchoNotNull(s);
		}
	}
}
