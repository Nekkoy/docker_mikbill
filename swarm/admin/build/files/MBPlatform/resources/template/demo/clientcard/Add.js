/**
 * Created by noname on 10.01.2018.
 */
Ext.define('Admin.view.el.form.clientcard.add.Add', {
    extend: 'Ext.Container',

    xtype: 'elformclientcardadd',

    layout: 'column',

    viewModel: {},

    initComponent: function(){
        var me = this;

        Ext.apply(me, {
            items: [
                {
                    xtype: 'container',
                    width: 384,
        
                    items: [
            
                        {
                            xtype: 'elformclientcardaddmail',
                            bind: {
                                hidden: '{!legal}'
                            }
                        },
                        {
                            xtype: 'elformclientcardaddbilling',
                            bind: {
                                hidden: '{!legal}'
                            }
                        },
                        {
                            xtype: 'fieldset',
                            title: '{{customuserskey}{внешние связи}}',
                            layout: 'fit',
                            items: [
                                {
                                    xtype: 'widgetclientcardcustomers',
                                    layout: 'fit',
                                    scroll: true,
                                    //width: 384,
                                    height: 160
                                }
                            ]
                        }
                    ]
                },
                {
                    xtype: 'container',
                    width: 384,
                 
                    items: [
                        {
                            xtype: 'fieldset',
                            title: '{{additionally}{дополнительно}}',
                            items: [
                                {
                                    xtype: 'elradiogroup',
                                    columns: 2,
                                    vertical: true,
                                    defaults: {
                                        name: "ext_legal_person"
                                    },
                                    listeners: {
                                        change: function(meu, newValue, oldValue, eOpts){
                                            var val = newValue.ext_legal_person;
                                            me.getViewModel().set('legal', val);
                                        }
                                    },
                                    items: [
                                        {
                                            inputValue: 0,
                                            boxLabel: '{{individual_person}{физическое лицо}}'
                                        },
                                        {
                                            inputValue: 1,
                                            boxLabel: '{{legal_person}{юридическое лицо}}'
                                        }
                                    ]
                                },
                                {
                                    xtype: 'elcheck',
                                    boxLabel: '{{ext_platporuch}{Платежное поручение}}',
                                    name: 'ext_platporuch'
                                },
                                {
                                    xtype: 'elcheck',
                                    boxLabel: '{{ext_arendator}{Арендатор}}',
                                    name: 'ext_arendator'
                                },
                                {
                                    xtype: 'elcheck',
                                    boxLabel: '{{ext_tovarishestv}{Товарищество}}',
                                    name: 'ext_tovarishestv'
                                }
                            ]
                        },
                        {
                            xtype: 'elformclientcardaddmain',
                            bind: {
                                hidden: '{!legal}'
                            }

                        }

                    ]
                },
                {
                    xtype: 'container',
                    width: 384,
                  
                    items: [

                        {
                            xtype: 'elformclientcardaddbank',
                            bind: {
                                hidden: '{!legal}'
                            }
                        },
                        {
                            xtype: 'elformclientcardaddlegal',
                            bind: {
                                hidden: '{!legal}'
                            }
                        }
                    ]
                },
            ]

        });

        me.callParent();
    }
});