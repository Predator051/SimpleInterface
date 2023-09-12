package controller;

import haxe.xml.Access;
import model.XmlLoader;
import feathers.data.ArrayCollection;
import feathers.controls.navigators.TabItem;
import feathers.controls.Label;
import feathers.controls.TextArea;

class TabController {
    var _xmlLoader:XmlLoader;

    public function new(xmlLoader:XmlLoader) {
        _xmlLoader = xmlLoader;
    }

    public function buildTabs() : ArrayCollection<TabItem> {
        var resultTabs:ArrayCollection<TabItem> = new ArrayCollection<TabItem>();
        var tabXml = _xmlLoader.load();
        
        var access = new Access(tabXml);
        if (!access.hasNode.root) {
            trace("There isn't root node");
            return resultTabs;
        }

        var root = access.node.root;
        if (!root.hasNode.tabs) {
            trace("There isn't tabs node");
            return resultTabs;
        }

        var tabs = root.node.tabs;
        
        for (tab in tabs.nodes.tab) {
            if (tab.hasNode.name && tab.hasNode.content) {
                var textArea = new TextArea();
                textArea.text = tab.node.content.innerData;
                textArea.editable = false;
                resultTabs.add(TabItem.withDisplayObject(
                    tab.node.name.innerData, textArea
                ));
            }
        }

        return resultTabs;
    }
}