import controller.TabController;
import model.loaders.OpenFLAssetLoader;
import model.XmlLoader;
import feathers.controls.Application;
import feathers.controls.navigators.TabNavigator;

//Used it like View part of MVP
class SimpleInterface extends Application {
	public function new() {
		super();

		var tabController = new TabController(
			new XmlLoader(new OpenFLAssetLoader("data/data.xml"))
		);

		tabController.buildTabs();

		var navigator = new TabNavigator();
		navigator.dataProvider = tabController.buildTabs();
		addChild(navigator);

	}
}