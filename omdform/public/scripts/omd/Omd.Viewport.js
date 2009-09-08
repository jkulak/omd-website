(function(){
	
	Ext.namespace( 'Omd.Viewport' );
	
	var _api = Omd.Viewport;
	
	var _lang = Omd.Langpl;
	
	_api.Init = function() {
	
		Ext.onReady(function(){
		
		    Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
		    
		    var viewport = new Ext.Viewport({
		        layout: 'border',
		        items: [
		        new Ext.BoxComponent({
		            region: 'north',
		            height: 80,
		            autoEl: {
		                tag: 'div',
		                html:'<p><img src="' + Omg.publicUrl + 'images/omdcms.jpg" alt="OMGCms - system zarzÄ�dzania treĹ�ciÄ�" /></p>'
		            }
		        }),
		        new Ext.TabPanel({
		            region: 'center',
		            deferredRender: false,
		            activeTab: 0,
		            items: [{
		                contentEl: 'article',
		                title: _lang.TabTitleArticle,
		                autoScroll: true,
		                items: [{
		                	defaults : {
		                		border : false
		                	},
		                	html : 'ArtykuĹ�y bÄ�dÄ� tu oĹ�je'
		                }]
		            }, {
		                contentEl: 'categories',
		                title: _lang.TabTitleCategories,
		                autoScroll: true
		            }]
		        })]
		    });
		});
		
	};
	
	_api.Init();

})();