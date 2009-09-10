(function(){
	
	Ext.namespace( 'Omd.Api' );
	
	var _self = Omd.Api;
	
	_self.getArticleList = new Ext.data.Store({
		url : Omd.apiUrl + 'index/getarticlelist',
     	reader: new Ext.data.JsonReader({
     		root: 'result.items'
     	}, [
     		{name: 'id'},
     		{name: 'title'},
     		{name: 'addedby'},
     		{name: 'status'}
     	])
    });
	
	_self.getCategoryList =  new Ext.data.Store({
		url : Omd.apiUrl + 'index/getcategorylist',
     	reader: new Ext.data.JsonReader({
     		root: 'result.items'
     	}, [
     		{name: 'id'},
     		{name: 'name'},
     		{name: 'addedby'}
     	])
    });
	

})();