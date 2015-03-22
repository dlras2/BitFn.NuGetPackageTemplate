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

		[Test, AutoData]
		public void AutoDataTestMethod1(Guid guid)
		{
		}
	}
}