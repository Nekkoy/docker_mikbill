/**
 * Created by noname on 10.01.2018.
 */
Ext.define('Admin.view.content.clientcard.Clientcard', {
    extend: 'Admin.view.widget.form.clientcard.Clientcard',

    requires: [
        'Admin.view.content.clientcard.ClientcardModel',
        'Admin.view.content.clientcard.ClientcardController'
    ],

    xtype: 'contentclientcard',

    viewModel: {
        type: 'contentclientcard'
    },

    controller: 'contentclientcard',

    reference: 'contentclientcard',

    listeners: {
        afterRender: 'onLoad',
        save: 'onSave',
        reload: 'onReload'
    },
    bbar: false,
    layout: {
        type: 'vbox',
        align: 'stretch'
    },
    items: [
        {
            xtype: 'widgetpanelclientcard',
            reference: 'widgetpanelclientcard',
            bind: {
                data: {
                    selection: '{selection}'
                }
            },
            listeners: {
                reload: 'onReload'
            }
        },
        {
            xtype: 'tabpanel',
            layout: 'fit',
            border: false,
            frame: false,
            items: [
                {
                    title: '{{contact}{контакт}}',
                    items: [
                        {
                            xtype: 'elformclientcardcontact',
                            items: [
                                {
                                    xtype: 'container',
                                    layout: {
                                        type: 'hbox',
                                        align: 'stretch'
                                    },
                                    defaults: {
                                        // bodyPadding: 15
                                    },
                                    width: 900,
                                    items: [
                                        {
                                            xtype: 'panel',
                                            layout: 'accordion',
                                            width: 350,
                                            items: [
                                                {
                                                    xtype: 'panel',
                                                    title: 'персональные данные',
                                                    items: [
                                                        {
                                                            xtype: 'elformclientcardcontactdogovor'
                                                        },
                                                        {
                                                            xtype: 'elformaddressclientcard',
                                                            collapsible: true
                                                        }
                                                    ]
                                                },
                                                {
                                                    xtype: 'panel',
                                                    title: 'интернет и основное устройство',
                                                    items: [
                                                        {
                                                            xtype: 'elformclientcardcontactinternet'
                                                        },
                                                        {
                                                            xtype: 'elformclientcardcontactmainswitch'
                                                        }
                                                    ]
                                                }
                                            ]
                                        },
                                        {
                                            xtype: 'panel',
                                            title: 'счет абонента',
                                            flex: 1,
                                            margin: '0 0 0 15',
                                            layout: {
                                                type: 'vbox',
                                                align: 'stretch'
                                            },
                                            items: [
                                                {
                                                    xtype: 'container',
                                                    layout: {
                                                        type: 'hbox',
                                                        align: 'stretch'
                                                    },
                                                    items: [
                                                        {
                                                            xtype: 'fieldset',
                                                            flex: 1,
                                                            title: 'тариф',
                                                            items: [
                                                                {
                                                                    xtype: 'eldisplay',
                                                                    fieldLabel: false,
                                                                    name: 'tarif',
                                                                    fieldStyle : {
                                                                        'font-size': '24px',
                                                                        color: '#157fcc',
                                                                        padding: 5
                                                                    }
                                                                },
                                                                {
                                                                    xtype: 'container',
                                                                    layout: {
                                                                        type: 'hbox'
                                                                    },
                                                                    items: [
                                                                        {
                                                                            xtype: 'eldisplay',
                                                                            fieldLabel: 'скорость',
                                                                            labelWidth: 60
                                                                        },
                                                                        {
                                                                            xtype: 'elbutton',
                                                                            iconCls: 'fa fa-cloud-download',
                                                                            bind: {
                                                                                text: '{speed_rate} kb/sec'
                                                                            }
                                                                        },
                                                                        {
                                                                            xtype: 'eldisplay',
                                                                            fieldLabel: false,
                                                                            value: "&nbsp;&nbsp;|&nbsp;&nbsp;",
                                                                            labelWidth: 60
                                                                        },
                                                                        {
                                                                            xtype: 'elbutton',
                                                                            iconCls: 'fa fa-cloud-upload',
                                                                            bind: {
                                                                                text: '{speed_burst} kb/sec'
                                                                            }
                                                                        }
                                                                    ]
                                                                },
                                                                {
                                                                    xtype: 'fieldcontainer',
                                                                    margin: 0,
                                                                    hidden: true,
                                                                    padding: 0,
                                                                    items: [
                                                                        {
                                                                            xtype: 'eldisplay',
                                                                            name: 'speed_rate_display',
                                                                            fieldLabel: false,
                                                                            hidden: true,
                                                                            fieldStyle : {
                                                                                minHeight : '15px'
                                                                            },
                                                                            bind: '{speed_rate}'
                                                                        },
                                                                        {
                                                                            iconCls: 'fa fa-cloud-upload'
                                                                        },
                                                                        {
                                                                            xtype: 'eldisplay',
                                                                            name: 'speed_burst_display',
                                                                            fieldStyle : {
                                                                                minHeight : '15px'
                                                                            },
                                                                            hidden: true,
                                                                            bind: '{speed_burst}'
                                                                        }
                                                                    ]
                                                                },
                                                                {
                                                                    xtype: 'eldisplaymin',
                                                                    fieldLabel: '{{status}{статус}}',
                                                                    fieldStyle : {
                                                                        minHeight : '15px'
                                                                    },
                                                                    name: 'status',
                                                                    renderer: function(value, field){
                                                                        if(value){
                                                                            return mbpScope.translate('{{'+value+'}{'+value+'}}');
                                                                        }
                                                                    },
                                                                    labelWidth: 55,
                                                                    margin: 0
                                                                },
                                                                {
                                                                    xtype: 'eldisplaymin',
                                                                    fieldLabel: '{{online}{онлайн}}',
                                                                    name: 'online',
                                                                    labelWidth: 55,
                                                                    renderer: function(value, field){
                                                                        if(value == '1'){
                                                                            return '<span style="color:#4df441">да</span>&nbsp;&nbsp;';
                                                                        }

                                                                        return '<span style="color:red">нет</span>&nbsp;&nbsp;';
                                                                    },
                                                                    margin: 0
                                                                }
                                                            ]
                                                        },
                                                        {
                                                            xtype: 'fieldset',
                                                            flex: 1,
                                                            // margin: '0 0 0 5',
                                                            title: 'баланс счета',
                                                            items: [
                                                                {
                                                                    xtype: 'eldisplaycur',
                                                                    fieldLabel: false,
                                                                    name: 'deposit',
                                                                    labelWidth: 55,
                                                                    value: '',
                                                                    fieldStyle : {
                                                                        'font-size': '24px',
                                                                        padding: 5
                                                                    },
                                                                    renderer: function(v){
                                                                        if(v < 0){
                                                                            v = '<span style="color:red">'+v+'</span>';
                                                                        } else {
                                                                            v = '<span style="color:green">'+v+'</span>';
                                                                        }
                                                                        return v;
                                                                    }
                                                                },
                                                                {
                                                                    xtype: 'eldisplaycur',
                                                                    name: 'credit',
                                                                    fieldLabel: '{{credit}{кредит}}',
                                                                    labelWidth: 55,
                                                                    fieldStyle : {
                                                                        minHeight : '15px'
                                                                    }
                                                                },
                                                                {
                                                                    xtype: 'eldisplaycur',
                                                                    name: 'deposit_bonus',
                                                                    fieldLabel: '{{bonus}{бонус}}',
                                                                    labelWidth: 55,
                                                                    fieldStyle : {
                                                                        minHeight : '15px'
                                                                    }
                                                                }
                                                            ]
                                                        }
                                                    ]
                                                },
                                                {
                                                    xtype: 'widgetgridclientcardpay',
                                                    bbar: false,
                                                    plugins: false,
                                                    lbar: false,
                                                    title: 'последние пополнения счета',
                                                    height: 200,
                                                    columns: [
                                                        {xtype: 'elgridcoldate', dataIndex: 'date', sortable: true},
                                                        {xtype: 'elgridcolip', text: "{{by_who}{кем}}", width: 100, dataIndex: 'who', sortable: true},
                                                        {xtype: 'elgridcoldeposit', text: "{{sum}{сумма}}", dataIndex: 'summa', sortable: true},
                                                        {text: "{{payment_type}{тип платежа}}", flex: 1, dataIndex: 'bughtypeid', sortable: true}
                                                    ],
                                                    bind: {
                                                        store: '{datagrid}'
                                                    }
                                                },
                                                {
                                                    title: '{{active_subscribsions}{активные подписки}}',
                                                    height: 200,
                                                    xtype: 'widgetgridclientcardserviceactive'
                                                }
                                            ]
                                        }
                                    ]
                                }
                            ],
                            autoScroll: true
                        }
                    ]
                },
                {
                    title: '{{additionally}{дополнительно}}',
                    items: [
                        {
                            autoScroll: true,
                            width: 1280,
                            xtype: 'elformclientcardadd'

                        }
                    ]
                },
                {
                    title: '{{individual_parameters_short}{индивид. параметры}}',
                    items: [
                        {
                            autoScroll: true,
                            width: 1280,
                            xtype: 'elformclientcardopt'

                        }
                    ]
                },
                {
                    title: '{{short_history}{краткая история}}',
                    layout: 'fit',
                    padding: 0,
                    items: [
                        {
                            xtype: 'elformclientcardhistory',
                            height: 600,
                            layout: 'fit',

                        }
                    ]
                }
            ]
        }
    ]

});