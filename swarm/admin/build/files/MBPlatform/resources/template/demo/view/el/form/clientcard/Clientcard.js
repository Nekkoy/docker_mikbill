/**
 * Created by noname on 10.01.2018.
 */
Ext.define('Admin.view.el.form.clientcard.Clientcard', {
    extend: 'Admin.view.el.form.Form',

    xtype: 'elformclientcard',

    url: '/json/users/updateuserflex',

    bodyPadding: 0,

    requires: [
        'Admin.view.el.form.clientcard.ClientcardModel',
        'Admin.view.el.form.clientcard.ClientcardController'
    ],

    controller: 'elformclientcard',
    
    viewModel: {
        type: 'elformclientcard'
    },

   /*  bbar: [
        {
            xtype: 'eldisplaydeposit'
        }, '-',
        {
            xtype: 'eldisplaycredit'
        }, '-',
        {
            xtype: 'eldisplayaddress'
        }, '-',
        {
            xtype: 'eldisplaytarif'
        }, '-',
        {
            xtype: 'eldisplayonline'
        }, '-',
        {
            xtype: 'eldisplayinetstatus'
        }
    ],

    items: [
        {
            xtype: 'eltableft',
            layout: 'fit',
            border: false,
            frame: false,
            tabBar: {
                items: [
                    {
                        xtype: 'container',
                        layout: {
                            type: 'vbox',
                            align: 'stretch'
                        },
                        defaults: {
                            width: 200,
                            border: false,
                            frame: false
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
                            }
                        ]
                    }
                ]
            },

            listeners: {
                render: function () {
                    this.tabBar.insert(0,
                        {
                            xtype: 'container',
                            layout: {
                                type: 'vbox',
                                align: 'stretch'
                            },

                            items: [
                                {
                                    xtype: 'elformclientcardbalance',
                                    padding: '0 0 0 10'
                                },
                                {
                                    xtype: 'container',
                                    padding: '0 0 0 10',
                                    items: [
                                        {
                                            xtype: 'box',
                                            autoEl: {tag: 'hr'}
                                        },
                                        {
                                            xtype: 'eldisplaymin',
                                            fieldLabel: '{{status}{статус}}',
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
                                            xtype: 'eldisplayonline'
                                        },
                                        {
                                            xtype: 'eldisplayinetstatus'
                                        }
                                    ]
                                },
                                {
                                    xtype: 'elcombousersusersgroupwithnone'
                                }
                            ]
                        }
                    );
                }
            },


            items: [
               {
                    title: '{{contact}{контакт}}',
                    items: [
                        {
                            xtype: 'elformclientcardcontact',
                            width: 1280,
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
                            xtype: 'elformclientcardhistory'

                        }
                    ]
                }
            ]
        }
    ] */
});