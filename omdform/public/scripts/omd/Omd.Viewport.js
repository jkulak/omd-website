(function(){
	
	Ext.namespace( 'Omd.Viewport' );
	
	var _self = Omd.Viewport;
	
	var _api = Omd.Api;
	
	var _lang = Omd.Langpl;
	
	var _store = {};
	
	var _controler = {};
	
	var _config = {};
	
	var _forms = {};
	
	var _view = {};
	
	var _editForm = {};
	
	var _editCategory = {};
	
    var _editFormInit = function(){

        _editForm = new Ext.FormPanel({
            hidden      : true,
            id          : 'omdarticleform',
            width       : 900,
            bodyStyle   : 'margin:5px',
            frame       : false,
            border      : false,
            layout      : 'form',
            labelWidth  : 160,
            defaults    : {
                border : false,
                labelStyle : 'text-align:right;',
                width : 700
            },
            items       : [
                { fieldLabel : 'Id', xtype :'textfield', id : 'articleid', name:'id', width: 60, readOnly : true },
                { allowBlank : false, fieldLabel : 'Tytuł', xtype :'textfield' ,name:'title' },
                { fieldLabel : 'Lead', xtype :'textarea' ,name:'lead' },
                { fieldLabel : 'Data aktywacji', xtype :'datefield' ,name:'activate', width: 180, format: 'Y-m-d H:i:s' },
                { fieldLabel : 'Data deaktywacji', xtype :'datefield' ,name:'deactivate', width: 180, format: 'Y-m-d H:i:s' },
                { fieldLabel : 'Content', id : 'contentTextarea', xtype :'textarea' ,name:'content', height : 600, listeners : {
                    render : function() {
                        tinyMCE.init({
                            // General options
                            mode : "exact",
                            elements : "contentTextarea",
                            theme : "advanced",
                            plugins : "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount",
                   
                            // Theme options
                            theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,formatselect,fontselect,fontsizeselect",
                            theme_advanced_buttons2 : "cut,copy,paste,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,|,forecolor,backcolor",
                            theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
                            //theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
                            
														//theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
                            //theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
                            //theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
                            //theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
														
														theme_advanced_toolbar_location : "top",
                            theme_advanced_toolbar_align : "left",
                            theme_advanced_statusbar_location : "bottom",
                            theme_advanced_resizing : true,
                   
                            // Example content CSS (should be your site CSS)
                            content_css : "css/content.css",
                   
                            // Drop lists for link/image/media/template dialogs
                            template_external_list_url : "lists/template_list.js",
                            external_link_list_url : "lists/link_list.js",
                            external_image_list_url : "lists/image_list.js",
                            media_external_list_url : "lists/media_list.js",
                   
                            // Replace values for the template plugin
                            template_replace_values : {
                                username : "Some User",
                                staffid : "991234"
                            },
														file_browser_callback : "tinyBrowser"
                        });
                        //tinyMCE.get('contentTextarea').getContent()
                    }
                } },
                //{ fieldLabel : 'Autor', xtype :'textfield' ,name:'addedby' },
                //{ fieldLabel : 'Autor modyfikacji', xtype :'textfield' ,name:'updatedby' },
                {
                    xtype : 'combo',
                    id : 'category',
                    name : 'category',
                    fieldLabel : 'Kategoria',
                    displayField : 'name',
                    hiddenId: 'categoryid',
                    hiddenName : 'categoryid',
                    valueField : 'id',
                    typeAhead : true,
                    mode : 'local',
                    triggerAction : 'all',
                    selectOnFocus : true,
                    store : _store.categoryList,
                    width : 100,
                    ctCls : 'filed'
                },
                {
                    xtype : 'combo',
                    id : 'status2',
                    name : 'status2',
                    fieldLabel : 'Status',
                    displayField : 'name',
                    hiddenId: 'statusid2',
                    hiddenName : 'statusid2',
                    valueField : 'id',
                    typeAhead : true,
                    mode : 'local',
                    triggerAction : 'all',
                    selectOnFocus : true,
                    store : _store.status,
                    width : 100,
                    ctCls : 'filed',
                    allowBlank : false
                }
            ]      
        });
        
        _editForm.resetForm = function(){
        	var form = _editForm.getForm();
            form.items.each(function(item){
            	item.setValue(null);
            });

            if( tinyMCE.get('contentTextarea') ) {
            	tinyMCE.get('contentTextarea').setContent(' ');
            }
        };
        
        _editFormCategory = new Ext.FormPanel({
            hidden      : true,
            id          : 'omdcategoryform',
            width       : 900,
            bodyStyle   : 'margin:5px',
            frame       : false,
            border      : false,
            layout      : 'form',
            labelWidth  : 160,
            defaults    : {
                border : false,
                labelStyle : 'text-align:right;',
                width : 700
            },
            items       : [
                { fieldLabel : 'Id', xtype :'textfield' ,name:'id', width: 60, readOnly : true },
                { allowBlank : false, fieldLabel : 'Nazwa kategorii:', xtype :'textfield' ,name:'name' }
            ]      
        });
        
        _editFormCategory.resetForm = function(){
            var form = _editFormCategory.getForm();
            form.items.each(function(item){
            	item.setValue(null);
            });
        };

    };
    
    var _initControler = function() {
    	_controler.add = function() {
    		_editForm.resetForm();
    		_editForm.getForm().setValues({ status2 : 'disabled' });
    		
    		_view.toggleEditMode( true, false );
    	}
    	
    	_controler.editArticle = function() {
            _editForm.resetForm();
            var selected = _gridPanel.selModel.getSelections()[0];
            if( selected && selected.data ) {
            	Ext.MessageBox.wait( 'Wczytuje...', 'Proszę czekać' );
            	Ext.Ajax.request({
            		   url: Omd.apiUrl + 'index/getarticle',
            		   success: function( ret, res ){
            			   Ext.MessageBox.hide();
            			   var data = Ext.util.JSON.decode( ret.responseText );

            			   _editForm.getForm().setValues({
            				   id : data.data.id,
            				   title : data.data.title,
            				   lead : data.data.lead,
            				   activate : data.data.activate,
            				   deactivate : data.data.deactivate,
            				   content : data.data.content,
            				   addedby : data.data.addedby,
            				   updatedby : data.data.updatedby,
            				   category : data.data.category,
            				   status2 : data.data.status
            			   });
            			   
            	            if( tinyMCE.get('contentTextarea') ) {
            	            	tinyMCE.get('contentTextarea').setContent(data.data.content);
            	            }

            			   _view.toggleEditMode();
            		   },
            		   failure: function(){
            			   Ext.MessageBox.hide();
            		   },
            		   params: { id: selected.data.id }
        		});
            }
    	}
    	
    	_controler.save = function() {
            var form   = _editForm.getForm();
            var values = form.getValues();
            values.content = tinyMCE.get('contentTextarea').getContent();

            if( form.isValid() ) {

            	Ext.MessageBox.wait( 'Zapisuje...', 'Proszę czekać' );
            	
            	form.submit({
            		params : {
            			content2 : values.content
            		},
            		url : Omd.apiUrl + 'index/setarticle',
            		success : function() {
            			_store.articleList.reload();
        				Ext.MessageBox.hide();
            			Ext.MessageBox.alert( 'Informacja', 'Dane zostały zapisane' );
            		},
            		failure : function() {
            			Ext.MessageBox.hide();
            			Ext.MessageBox.alert( 'Informacja', 'Wystąpił błąd podczas zapisu' );
            		}
            	});
            	_view.toggleEditMode( false, true );
            }
    	}
    	
    	_controler.cancel = function() {
    		_view.toggleEditMode( false, true );
    	}
    	
    	_controler.delArticle = function() {
            var selected = _gridPanel.selModel.getSelections();

            if( selected.length ) {
                Ext.Msg.show({
                    title: 'Usuwanie',
                    msg: ( selected.length > 1 ) ? 'Usunąć wybrane artykuły?' : 'Usunąć wybrany artykuł?',
                    buttons: Ext.Msg.YESNO,
                    fn: function( e ){
                        if( e == 'yes' ) {
                        	Ext.MessageBox.wait( 'Usuwam...', 'Proszę czekać' );
                        	
                        	var remove = function( a ) {
                            	Ext.Ajax.request({
                          		   url: Omd.apiUrl + 'index/delarticle',
                          		   success: function( ret, res ){
                             		  if( a == selected.length ) {
                             			  Ext.MessageBox.hide();
                             			  Ext.MessageBox.alert( 'Informacja', ( selected.length > 1 ) ? 'Usunięto wybrane artykuły' : 'Usunięto wybrany artykuł' )
                             			  _store.articleList.reload();
                             		  }
                          		   },
                          		   failure: function(){
                          		   },
                          		   params: { id: selected[i].data.id }
                             	});
                        	};
                        	
                        	var a = 1;
                        	for( var i = 0, len = selected.length; i < len; i++ ) {
                        		remove( a );
                            	a++;
                        	}
                        	
                        	_view.toggleEditMode( true, true );
                        }
                    },
                    animEl: 'elId',
                    icon: Ext.MessageBox.QUESTION
                });
            } else {
            	Ext.MessageBox.hide();
            	Ext.MessageBox.alert( 'Informacja', 'Wystąpił błąd podczas zapisu' );
            }
        };
    	
    	_controler.addCategory = function() {
    		_editFormCategory.resetForm();
    		_view.toggleEditCategoryMode( true, false );
    	}
    	
    	_controler.editCategory = function() {
            _editFormCategory.resetForm();
            var selected = _gridPanelCategory.selModel.getSelections()[0];
            if( selected && selected.data ) {
            	Ext.MessageBox.wait( 'Wczytuje...', 'Proszę czekać' );
            	Ext.Ajax.request({
            		   url: Omd.apiUrl + 'index/getcategory',
            		   success: function( ret, res ){
            			   Ext.MessageBox.hide();
            			   var data = Ext.util.JSON.decode( ret.responseText );

            			   _editFormCategory.getForm().setValues({
            				   id : data.data.id,
            				   name : data.data.name
            			   });

            			   _view.toggleEditCategoryMode();
            		   },
            		   failure: function(){
            			   Ext.MessageBox.hide();
            		   },
            		   params: { id: selected.data.id }
        		});
            }
    	}
    	
    	_controler.saveCategory = function() {
            var form   = _editFormCategory.getForm();
            var values = form.getValues();

            if( form.isValid() ) {
            	console.log( values );
            	
            	//Ext.MessageBox.wait( 'Zapisuje...', 'Proszę czekać' );
            	
            	form.submit({
            		url : Omd.apiUrl + 'index/setcategory',
            		success : function() {
            			_store.categoryList.reload();
        				Ext.MessageBox.hide();
            			Ext.MessageBox.alert( 'Informacja', 'Dane zostały zapisane' );
            		},
            		failure : function() {
            			Ext.MessageBox.hide();
            			Ext.MessageBox.alert( 'Informacja', 'Wystąpił błąd podczas zapisu' );
            		}
            	});
            	
            	_view.toggleEditCategoryMode( false, true );
            }
    	}
    	
    	_controler.cancelCategory = function() {
    		_view.toggleEditCategoryMode( false, true );
    	}
    	
    	_controler.delCategory = function() {
    		var selected = _gridPanelCategory.selModel.getSelections();
    		
    		if( selected.length ) {
                Ext.Msg.show({
                    title: 'Usuwanie',
                    msg: ( selected.length > 1 ) ? 'Usunąć wybrane kategorie?' : 'Usunąć wybraną kategorie?',
                    buttons: Ext.Msg.YESNO,
                    fn: function( e ){
                        if( e == 'yes' ) {
                        	Ext.MessageBox.wait( 'Usuwam...', 'Proszę czekać' );
                        	var isSet666code = false;
                        	var remove = function( a ) {
                            	Ext.Ajax.request({
                          		   url: Omd.apiUrl + 'index/delcategory',
                          		   success: function( ret, res ){
                            		  var code = Ext.util.JSON.decode( ret.responseText ).code;
                            		  var ei = a-1;

                            		  if( ( code == 666 ) && ( a != selected.length ) ) {
                            			  isSet666code = true;
                            			  Ext.MessageBox.hide();
                            			  Ext.MessageBox.alert( 'Informacja', 'Kategoria <b>' + selected[ei].data.name + '</b> nie została usunięta ponieważ jest powiązana z artykułami.' );
                            		  } else if( ( code == 666 ) && ( a == selected.length ) ) { 
                            			  isSet666code = true;
                            			  Ext.MessageBox.hide();
                             			  Ext.MessageBox.alert( 'Informacja', ( selected.length > 1 ) ? 'Usunięto wybrane kategorie, poza kategorią <b>' + selected[ei].data.name + '</b>, ponieważ ta jest powiązana z artykułami' : 'Kategoria <b>' + selected[ei].data.name + '</b> nie została usunięta ponieważ jest powiązana z artykułami.' )
                             			  _store.categoryList.reload();
                            		  } else {
	                             		  if( a == selected.length ) {
	                             			  if( !isSet666code ) {
		                             			  Ext.MessageBox.hide();
		                             			  Ext.MessageBox.alert( 'Informacja', ( selected.length > 1 ) ? 'Usunięto wybrane kategorie' : 'Usunięto wybraną kategorię' )
	                             			  }
	                             			 _store.categoryList.reload();
	                             		  }
                            		  }
                          		   },
                          		   failure: function(){
                          		   },
                          		   params: { id: selected[i].data.id }
                             	});
                        	};
                        	
                        	var a = 1;
                        	for( var i = 0, len = selected.length; i < len; i++ ) {
                        		remove( a );
                            	a++;
                        	}
                        	
                        	_view.toggleEditMode( true, true );
                        }
                    },
                    animEl: 'elId',
                    icon: Ext.MessageBox.QUESTION
                });
            } else {
            	Ext.MessageBox.hide();
            	Ext.MessageBox.alert( 'Informacja', 'Wystąpił błąd podczas zapisu' );
            }
    	}
    }
	
    var _configInit = function(){
        
        _config.pager = {
           first : 0,
           limit : 40
        };
    };
	
	var _initStore = function() {
		
		_store.articleList = _api.getArticleList;
		
		_store.categoryList = _api.getCategoryList;
		
		_store.status = _api.getStatus;

	};
	
	var _viewInit = function() {
	    _view.toggleEditMode = function( create, showList ){
	        var create = create || false;
	        var showList = showList || false;
	        if (  showList ) {
	            _editForm.hide();
	            _gridPanel.show();
	
	            Ext.getCmp('omdAddArticle').enable();
	            Ext.getCmp('omdSaveArticle').disable();
	            Ext.getCmp('omdEditArticle').enable();         
	            Ext.getCmp('omdCancelArticle').disable();  
	            Ext.getCmp('omdDeleteArticle').enable();
	            Ext.getCmp('omgbbarart').show();
	        }else{
	        	_editForm.show();
	            _gridPanel.hide();
	
	            Ext.getCmp('omdAddArticle').disable();
	            Ext.getCmp('omdSaveArticle').enable();
	            Ext.getCmp('omdEditArticle').disable();        
	            Ext.getCmp('omdCancelArticle').enable();
	            if( create ) {
	            	Ext.getCmp('omdDeleteArticle').disable();
	            	//console.log( Ext.getCmp('articleid') );
	            }
	            Ext.getCmp('omgbbarart').hide();
	        }
	    }
	    
	    _view.toggleEditCategoryMode = function( create, showList ){
	        var create = create || false;
	        var showList = showList || false;
	        if (  showList ) {
	            _editFormCategory.hide();
	            _gridPanelCategory.show();
	
	            Ext.getCmp('omdAddCategory').enable();
	            Ext.getCmp('omdSaveCategory').disable();
	            Ext.getCmp('omdEditCategory').enable();         
	            Ext.getCmp('omdCancelCategory').disable();  
	            Ext.getCmp('omdDeleteCategory').enable();   
	            Ext.getCmp('omgbbar').show();
	        }else{
	        	_editFormCategory.show();
	            _gridPanelCategory.hide();
	
	            Ext.getCmp('omdAddCategory').disable();
	            Ext.getCmp('omdSaveCategory').enable();
	            Ext.getCmp('omdEditCategory').disable();        
	            Ext.getCmp('omdCancelCategory').enable();
	            if( create ) Ext.getCmp('omdDeleteCategory').disable();
	            Ext.getCmp('omgbbar').hide();
	        }
	    }
    }
	
	var _dataPager = {};
	var _dataPagerCategory = {};
	
    var _dataPagerInit = function(){
        _dataPager = _dataPagerCreate();
        _dataPagerCategory = _dataPagerCategoryCreate();
    };
    var _dataPagerCreate = function(){
        return new Ext.PagingToolbar({
        	id : 'omgbbarart',
            pageSize    : _config.pager.limit,
            store       : _store.articleList,
            displayInfo : false,
            emptyMsg    : 'error',
            refreshText : '',
            paramNames  : { start: 'first', limit: 'limit' },
            listeners   : {
//                 change : function(){},
//                 beforechange   : function( el , config ){
//                     el.store.baseParams = el.store.baseParams;
//
//                     el.store.baseParams.start = ( config.first ) ? parseInt( config.first / _config.pager.limit ) + 1 : 1;
//                }
            }
        });
    };
    
    var _dataPagerCategoryCreate = function(){
        return new Ext.PagingToolbar({
        	id : 'omgbbar',
            pageSize    : _config.pager.limit,
            store       : _store.categoryList,
            displayInfo : false,
            emptyMsg    : 'error',
            refreshText : '',
            paramNames  : { start: 'first', limit: 'limit' },
            listeners   : {
//                 change : function(){},
//                 beforechange   : function( el , config ){
//                     el.store.baseParams = el.store.baseParams;
//
//                     el.store.baseParams.start = ( config.first ) ? parseInt( config.first / _config.pager.limit ) + 1 : 1;
//                }
            }
        });
    };
	
    var _controllToolbar = null;
    var _controllToolbarCategory = null;
    var _controllToolbarInit = function(){

        _controllToolbar = new Ext.Toolbar({
                frame:false,
                border:false,
                items   : [{
                    text        : _lang.toolbarTitleAdd, 
                    id          : 'omdAddArticle',
                    handler     : _controler.add,
                    tooltip     : {
                        text    : _lang.toolbarTextAdd,
                        title   : _lang.toolbarTitleAdd,
                        autoHide: true
                    }
                },{
                    text        : _lang.toolbarTitleSave, 
                    id          : 'omdSaveArticle',
                    disabled    : true,
                    handler     : _controler.save,
                    tooltip     : {
                        text    : _lang.toolbarTextSave,
                        title   : _lang.toolbarTitleSave,
                        autoHide: true
                    }
                },{
                    text        : _lang.toolbarTitleEdit, 
                    id          : 'omdEditArticle',
                    handler     :  _controler.editArticle,
                    tooltip     : {
                        text    : _lang.toolbarTextEdit,
                        title   : _lang.toolbarTitleEdit,
                        autoHide: true
                    }
                },{
                    text        : _lang.toolbarTitleCancel, 
                    id          : 'omdCancelArticle',
                    disabled    :true,
                    handler     : _controler.cancel,
                    tooltip     : {
                        text    : _lang.toolbarTextCancel,
                        title   : _lang.toolbarTitleCancel,
                        autoHide: true
                    }
                },{
                    text        : _lang.toolbarTitleDelete, 
                    id          : 'omdDeleteArticle',
                    handler     :  _controler.delArticle,
                    tooltip     : {
                        text    : _lang.toolbarTextDelete,
                        title   : _lang.toolbarTitleDelete,
                        autoHide: true
                    }
                }]
            });
        
        _controllToolbarCategory = new Ext.Toolbar({
            frame:false,
            border:false,
            items   : [{
                text        : _lang.toolbarTitleAddCategory, 
                id          : 'omdAddCategory',
                handler     : _controler.addCategory,
                tooltip     : {
                    text    : _lang.toolbarTextAddCategory,
                    title   : _lang.toolbarTitleAddCategory,
                    autoHide: true
                }
            },{
                text        : _lang.toolbarTitleSaveCategory, 
                id          : 'omdSaveCategory',
                disabled    : true,
                handler     : _controler.saveCategory,
                tooltip     : {
                    text    : _lang.toolbarTextSaveCategory,
                    title   : _lang.toolbarTitleSaveCategory,
                    autoHide: true
                }
            },{
                text        : _lang.toolbarTitleEditCategory, 
                id          : 'omdEditCategory',
                handler     :  _controler.editArticle,
                tooltip     : {
                    text    : _lang.toolbarTextEditCategory,
                    title   : _lang.toolbarTitleEditCategory,
                    autoHide: true
                }
            },{
                text        : _lang.toolbarTitleCancelCategory, 
                id          : 'omdCancelCategory',
                disabled    :true,
                handler     : _controler.cancelCategory,
                tooltip     : {
                    text    : _lang.toolbarTextCancelCategory,
                    title   : _lang.toolbarTitleCancelCategory,
                    autoHide: true
                }
            },{
                text        : _lang.toolbarTitleDeleteCategory, 
                id          : 'omdDeleteCategory',
                handler     :  _controler.delCategory,
                tooltip     : {
                    text    : _lang.toolbarTextDeleteCategory,
                    title   : _lang.toolbarTitleDeleteCategory,
                    autoHide: true
                }
            }]
        });
    };
	
    var _gridPanel = null;
    var _gridPanelCategory = null;

    var _gridPanelInit = function(){
        
        _gridPanel = new Ext.grid.GridPanel({
            store: _store.articleList,
            viewConfig: { forceFit: true },
            columns: [{
                header: _lang.gridTitleItemId, width: 5,  sortable: true, dataIndex: 'id'
            }, {
                header: _lang.gridTitleItemTitle, width: 100, sortable: true, dataIndex: 'title'
            }, {
            	header: _lang.gridTitleItemCategory, width: 50, sortable: true, dataIndex: 'categoryName'
            }, {
                header: _lang.gridTitleItemStatus, width: 50, sortable: true, dataIndex: 'status'
            }],
            stripeRows: true,
            autoHeight :true,
            width: '100%',
            title: _lang.gridTitleArticle,
            listeners : {
                render  :   function(){
                    var height = Ext.get('omdViewport').getHeight();  
                    Ext.get(this.id).dom.style.width = height+"px";
                    _store.articleList.reload();
                },
                rowdblclick : _controler.editArticle
            }
        });
        
        _gridPanelCategory = new Ext.grid.GridPanel({
            store: _store.categoryList,
            viewConfig: { forceFit: true },
            columns: [{
                header: _lang.gridTitleItemId, width: 30,  sortable: true, dataIndex: 'id'
            }, {
                header: _lang.gridTitleItemTitle, width: 200, sortable: true, dataIndex: 'name'
            }/*, {
            	header: _lang.gridTitleItemAddedby, width: 100, sortable: true, dataIndex: 'addedby'
            }*/],
            stripeRows: true,
            autoHeight :true,
            width: '100%',
            title: _lang.gridTitleArticle,
            listeners : {
                render  :   function(){
                    var height = Ext.get('omdViewport2').getHeight();  
                    Ext.get(this.id).dom.style.width = height+"px";
                    _store.categoryList.reload();
                },
                rowdblclick : _controler.editCategory
            }
        });

    };

	_self.Init = function() {
		Ext.QuickTips.init();
		
		_configInit();
		_viewInit();
		_initStore();
		_dataPagerInit();
		_initControler();
		_gridPanelInit();
		_controllToolbarInit();
		_editFormInit();
	
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
		                html:'<p><img src="' + Omd.publicUrl + 'images/omdcms.jpg" alt="OMGCms - system zarzÄ�dzania treĹ�ciÄ�" /></p>'
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
		                    margins     : '5 0 0 0',
		                    id          : 'omdViewport',
		                    //layout      : 'fit',
		                    bodyStyle   : { "overflow-y" : "auto" },
		                    tbar        : [ _controllToolbar],
		                    items       : [ _gridPanel, _editForm ],
		                    bbar        : _dataPager
		                }]
		            },{
		                contentEl: 'categories',
		                title: _lang.TabTitleCategories,
		                autoScroll: true,
		                items: [{
		                	defaults : {
		                		border : false
		                	},
		                    margins     : '5 0 0 0',
		                    id          : 'omdViewport2',
		                    //layout      : 'fit',
		                    bodyStyle   : { "overflow-y" : "auto" },
		                    tbar        : [ _controllToolbarCategory],
		                    items       : [ _gridPanelCategory, _editFormCategory ],
		                    bbar        : _dataPagerCategory
		                }]
		            }]
		        })]
		    });
		});
		
	};
	
	_self.Init();

})();

if( !window.console ) {
    window.console = {};
    window.console.log = function(){};
    window.console.dir = function(){};
    window.console.info = function(){};
    window.console.error = function(){};
}
