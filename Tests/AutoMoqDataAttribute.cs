using Ploeh.AutoFixture;
using Ploeh.AutoFixture.AutoMoq;
using Ploeh.AutoFixture.NUnit2;

namespace BitFn.CoreUtilities.ProjectTemplate.Tests
{
	public class AutoMoqDataAttribute : AutoDataAttribute
	{
		public AutoMoqDataAttribute()
			: base(new Fixture().Customize(new AutoMoqCustomization()))
		{
		}
	}
}