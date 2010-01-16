(function(){
	
	Ext.namespace( 'Omd.Api' );
	
	var _self = Omd.Api;
	
	_self.getArticleList = new Ext.data.Store({
		url : Omd.apiUrl + 'index/getarticlelist',
     	reader: new Ext.data.JsonReader({
     		root: 'result.items',
     		totalProperty : 'result.total'
     	}, [
     		{name: 'id'},
     		{name: 'title'},
     		{name: 'categoryName'},
     		{name: 'status'}
     	])
    });
	
	_self.getCategoryList =  new Ext.data.Store({
		url : Omd.apiUrl + 'index/getcategorylist',
     	reader: new Ext.data.JsonReader({
     		root: 'result.items',
     		totalProperty : 'result.total'
     	}, [
     		{name: 'id'},
     		{name: 'name'},
     		{name: 'addedby'}
     	])
    });
	
	_self.getStatus = new Ext.data.Store({
		data : { 'status' : [
      			{ name : ['Wlaczony'], id : 'enabled' },
      			{ name : ['Wylaczony'], id : 'disabled' },
      			{ name : ['Skasowany'], id : 'deleted' },
      			{ name : ['Dev'], id : 'dev' }
      		]
      	},
      	reader: new Ext.data.JsonReader({
      		root: 'status'
      	}, [
      		{name: 'name'},
      		{name: 'id'}
      	])
      });


})();