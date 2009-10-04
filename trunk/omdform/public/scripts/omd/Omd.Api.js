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
      			{ name : ['enabled'], id : 'enabled' },
      			{ name : ['disabled'], id : 'disabled' },
      			{ name : ['test'], id : 'test' }
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