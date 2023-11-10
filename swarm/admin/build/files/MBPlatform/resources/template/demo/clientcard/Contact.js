/**
 * Created by noname on 10.01.2018.
 */
Ext.define('Admin.view.el.form.clientcard.contact.ContactNew', {
    extend: 'Ext.Container',

    xtype: 'elformclientcardcontactnew',

    layout: 'column',

    items: [
        {
            xtype: 'container',
            columnWidth: .3,
            minWidth: 384,
            items: [
                {
                    xtype: 'elformclientcardcontactinternet',
                    items: [
        
                        {
                            xtype: 'fieldcontainer',
                            layout: 'hbox',
                            items: [
                                {
                                    xtype: 'eltextfieldmin',
                                    inputType: 'password',
                                    name: 'password',
                                    labelWidth: 50,
                                    reference: 'passwordtextfield',
                                    value: '',
                                    flex : 1,
                                    anchor:'100%',
                                    listeners:{
                                        afterrender:function(cmp){
                                            cmp.inputEl.set({
                                                autocomplete: "new-password"
                                            });
                                        }
                                    },
                                    bind: {
                                        copy: '{stuff_propers.do_show_passwd == "1"}',
                                        readOnly: '{stuff_propers.edit_pass == "0"}'
                                    },
                                    fieldLabel: 'test {{password}{пароль}}'
                                },
                                {
                                    xtype: 'elbuttonshowpass',
                                    bind: {
                                        hidden: '{stuff_propers.do_show_passwd == "0"}'
                                    }
                                }
                            ]
                        },
                        {
                            xtype: 'fieldcontainer',
                            layout: 'hbox',
                            items: [
                                {
                                    xtype: 'eltextfieldlogin',
                                    bind: {
                                        readOnly: '{stuff_propers.edit_login == "0"}',
                                        value: 'test {login}'
                                    },
                                    reference: 'user',
                                    flex: 1,
                                    listeners:{
                                        afterrender:function(cmp){
                                            cmp.inputEl.set({
                                                autocomplete: "new-password"
                                                // autocomplete: "off"
                                            });
                                        }
                                    },
                                }
                            ]
                        },
        
                        {
                            xtype: 'elcheck',
                            boxLabel: 'test {{internet}{Интернет}}',
                            inputValue: '0',
                            uncheckedValue: '1',
                            name: 'blocked'
                        },
                        {
                            xtype: 'fieldcontainer',
                            bind: {
                                hidden: '{stuff_propers.do_simple_change_tarif == "1"}',
                                disabled: '{stuff_propers.do_change_tarif == "0"}'
                            },
                            items: [
                                {
                                    xtype: 'eldisplay',
                                    fieldLabel: 'test {{tariff}{тариф}}',
                                    width: 45,
                                    submitValue: false
                                },
                                {
                                    xtype: 'button',
                                    handler: 'doSimpleChangeTarif',
                                    bind: {
                                        text: '{data.tarif}'
                                    },
                                    flex: 1
                                }
                            ]
                        },
                        {
                            xtype: 'elcombouserstariflist',
                            fieldLabel: 'test {{tariff}{тариф}}',
                            labelWidth: 50,
                            labelAlign: 'top',
                            bind: {
                                disabled: '{stuff_propers.do_change_tarif == "0"}',
                                hidden: '{stuff_propers.do_simple_change_tarif == "0"}'
                            },
                            name: 'gid'
                        },
                        {
                            xtype: 'eltextfieldmin',
                            bind: {
                                value: '{gidd}'
                            },
                            hidden: true,
                            name: 'gidd'
                        },
                        {
                            xtype: 'fieldcontainer',
                            bind: {
                                disabled: '{stuff_propers.do_change_tarif == "0"}'
                            },
                            items: [
                                {
                                    xtype: 'eldisplay',
                                    fieldLabel: '{{future_tariff}{будущий тариф}}',
                                    width: 90,
                                    submitValue: false
                                },
                                { xtype: 'eldelim' },
                                {
                                    xtype: 'button',
                                    flex: 1,
                                    handler: 'onChangeFutureTariff',
                                    bind: {
                                        text: '{data.gidd}'
                                    },
                                    listeners: {
                                        textchange: 'onTextChangeFutureTariff'
                                    }
                                }
                            ]
                        },
        
                        {
                            xtype: 'elcheck',
                            boxLabel: 'test {{real_ip}{реальный IP}}',
                            submitValue: false,
                            reference: 'elcheckrealip',
                            bind: {
                                disabled: '{stuff_propers.do_edit_ip == "0"}'
                            },
                            name: 'real_ip',
                        },
                        {
                            xtype: 'fieldcontainer',
                            layout: 'hbox',
                            bind: {
                                hidden: '{sysopts.dont_display_framed_ip == "1"}'
                            },
                            items: [
                                {
                                    xtype: 'eltextfieldmin',
                                    fieldLabel: 'test {{framed_ip}{framed IP}}',
                                    flex: 1,
                                    copy: true,
                                    readOnly: true,
                                    name: 'framed_ip',
                                    bind: {
                                        hidden: '{sysopts.get_from_online_framed_ip == "1" && online == "1"}'
                                    },
                    
                                },
                                {
                                    xtype: 'elbuttonedit',
                                    bind: {
                                        disabled: '{!elcheckrealip.checked}',
                                        hidden: '{stuff_propers.do_edit_ip == "0" || (sysopts.get_from_online_framed_ip == "1" && online == "1")}'
                                    }
                                },
                
                
                                // Framed IP is not editable if get_from_online_framed_ip == 1 and user is online
                                {
                                    xtype: 'eltextfieldmin',
                                    fieldLabel: '{{framed_ip}{framed IP}}',
                                    flex: 1,
                                    // copy: true,
                                    readOnly: true,
                                    // name: 'framed_ip',
                                    submitValue: false,
                                    hidden: true,
                                    bind: {
                                        visible: '{sysopts.get_from_online_framed_ip == "1" && online == "1"}',
                                        value: '{current_ip_ref.value}',
                                    },
                    
                                },
                            ]
                        },
                        {
                            xtype: 'fieldcontainer',
            
                            items: [
                                {
                                    xtype: 'eltextfieldmin',
                                    fieldLabel: '{{current_ip}{текущий IP}}',
                                    reference: 'current_ip_ref',
                                    publishes: 'value',
                                    flex: 1,
                                    readOnly: true,
                                    copy: true,
                                    name: 'framedipaddress'
                                }
                            ]
                        },
                        {
                            xtype: 'elformclientcardcontactinternetabonentipv6'
                        }
                    ]
                },
                {
                    xtype: 'elformaddressclientcardnew',
                    bind: {
                        hidden: '{use_old_address.checked}',
                        disabled: '{use_old_address.checked}'
                    }
                },
                {
                    xtype: 'elcheck',
                    reference: 'use_old_address',
        
                    submitValue: false,
                    boxLabel: '{{old_}{старая}} {{version}{версия}} {{input_}{ввода}} {{address_}{адреса}}'
                },
                {
                    xtype: 'elformaddressclientcard',
                    //xtype: 'widgetformaddressclientcarddev',
                    bind: {
                        hidden: '{!use_old_address.checked}',
                        disabled: '{!use_old_address.checked}'
                    },
                    collapsible: true
                },
                {
                    xtype: 'elformclientcardcontactpassport'
                }
            ]
        },
        {
            xtype: 'container',
       
            columnWidth: .3,
            minWidth: 384,
            items: [
                {
                    xtype: 'elformclientcardcontactdogovor'
                },
                {
                    xtype: 'widgetclientcardcontactmainswitch'
                }

            ]
        },
        {
            xtype: 'elformclientcardcontactsubscription',
            columnWidth: .3,
            minWidth: 384,
           
            defaults: {
                layout: 'fit'
            }
        }
    ]
});