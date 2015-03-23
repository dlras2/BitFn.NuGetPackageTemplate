using System;
using NUnit.Framework;
using Ploeh.AutoFixture.NUnit2;

namespace BitFn.CoreUtilities.ProjectTemplate.Tests
{
	[TestFixture]
	public class UnitTest1
	{
		[Test]
		public void TestMethod1()
		{
		}

		[Test, AutoMoqData]
		public void AutoDataTestMethod1(Guid guid, Class1 sut)
		{
			var expected = "Argument: " + guid;
			var actual = sut.Echo(guid.ToString());
			Assert.AreEqual(expected, actual);
		}
	}
}