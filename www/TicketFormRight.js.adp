/**
 * intranet-sencha-ticket-tracker/www/TicketFormRight.js
 * Ticket form to allow modifying the "right hand side"
 * of an existing ticket
 *
 * @author Frank Bergmann (frank.bergmann@project-open.com)
 * @creation-date 2011-05
 * @cvs-id $Id$
 *
 * Copyright (C) 2011, ]project-open[
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

var ticketInfoPanel = Ext.define('TicketBrowser.TicketFormRight', {
	extend: 	'Ext.form.Panel',	
	alias: 		'widget.ticketFormRight',
	id:		'ticketFormRight',
	standardsubmit:	false,
	frame:		true,
	title: 		'#intranet-core.Ticket#',
	bodyStyle:	'padding:5px 5px 0',
	width:		800,

	fieldDefaults: {
		msgTarget: 'side',
		labelWidth: 75
	},
	defaultType:	'textfield',
	defaults: {
	        mode:           'local',
	        queryMode:      'local',
	        value:          '',
	        displayField:   'pretty_name',
	        valueField:     'id'
	},
	items: [

	// tell the /intranet-helpdesk/new page to return JSON
	{ name: 'format',		xtype: 'hiddenfield', value: 'json' },

	// Variables for the new.tcl page to recognize an ad_form
	{ name: 'ticket_id',		xtype: 'hiddenfield'},
	{ name: 'ticket_last_queue_id',	xtype: 'hiddenfield'},

	// Main ticket fields
        {
	    xtype:	'fieldset',
            title:	'',
            checkboxToggle: false,
            collapsed:	false,
	    frame:	false,
	    width:	800,

            layout: 	{ type: 'table', columns: 3 },
            items :[{
	                name:           'ticket_creation_date',
	                xtype:          'datefield',
	                fieldLabel:     '#intranet-sencha-ticket-tracker.Creation_Date#',
			format:		'Y-m-d'
	        }, {
	                name:           'ticket_incoming_channel_id',
	                fieldLabel:     '#intranet-sencha-ticket-tracker.Incoming_Channel#',
		        xtype:		'combobox',
		        valueField:	'category_id',
		        displayField:	'category_translated',
		        forceSelection: true,
		        queryMode: 	'remote',
		        store: 		ticketChannelStore
	        }, {
	                name:           'ticket_channel_detail_id',
	                fieldLabel:     '#intranet-sencha-ticket-tracker.Channel_Details#',
		        xtype:		'hiddenfield',
		        valueField:	'category_id',
		        displayField:	'category_translated',
		        forceSelection: true,
		        queryMode: 	'remote',
		        store: 		ticketStatusStore
	        }, {
	                name:           'ticket_done_date',
	                xtype:          'datefield',
	                fieldLabel:     '#intranet-sencha-ticket-tracker.Close_Date#',
			format:		'Y-m-d'
	        }, {
	                name:           'ticket_escalation_date',
	                xtype:          'datefield',
	                fieldLabel:     '#intranet-sencha-ticket-tracker.Escalation_Date#',
			format:		'Y-m-d'
	        }, {
	                name:           'ticket_reaction_date',
	                xtype:          'datefield',
	                fieldLabel:     '#intranet-sencha-ticket-tracker.Reaction_Date#',
			format:		'Y-m-d'
	    }]

	}, {

	    xtype:	'fieldset',
            title:	'',
            checkboxToggle: false,
            collapsed:	false,
	    frame:	false,
	    width:	800,

            layout: 	{ type: 'table', columns: 2 },
            items :[{
	                name:           'ticket_request',
			xtype:		'textareafield',
			fieldLabel:	'#intranet-sencha-ticket-tracker.Request#',
			width:		400
	        }, {
	                name:           'ticket_resolution',
			xtype:		'textareafield',
			fieldLabel:	'#intranet-sencha-ticket-tracker.Resolution#',
			width:		400
	    }]

	}, {
	    xtype:	'fieldset',
            title:	'',
            checkboxToggle: false,
            collapsed:	false,
	    frame:	false,
	    width:	800,

            layout: 	{ type: 'table', columns: 3 },
            items :[{
			name:		'ticket_closed_in_1st_contact_p',
			xtype:		'checkbox',
			fieldLabel:     '#intranet-core.lt_Closed_in_1st_Contact#',
			inputValue:	't',
			width:		150
	    }, {
			name:		'ticket_requires_addition_info_p',
			xtype:		'checkbox',
			fieldLabel:     '#intranet-sencha-ticket-tracker.Requires_additional_info#',
			inputValue:	't',
			width:		150
	        }, {
	                name:           'ticket_outgoing_channel_id',
	                fieldLabel:     '#intranet-sencha-ticket-tracker.Outgoing_Channel#',
		        xtype:		'combobox',
		        valueField:	'category_id',
		        displayField:	'category_translated',
		        forceSelection: true,
		        queryMode: 	'remote',
		        store: 		ticketChannelStore
	    }]

	}, {

	    xtype:	'fieldset',
            title:	'',
            checkboxToggle: false,
            collapsed:	false,
	    frame:	false,
	    width:	800,

            layout: 	{ type: 'table', columns: 2 },
            items :[{
			fieldLabel: '#intranet-core.Status#',
			name: 'ticket_status_id',
			xtype: 'combobox',
	                valueField: 'category_id',
	                displayField: 'category_translated',
			forceSelection: true,
			queryMode: 'remote',
			store: ticketStatusStore,
			width: 200
	    }, {
			fieldLabel: '#intranet-sencha-ticket-tracker.Escalated#',
			name: 'ticket_queue_id',
			xtype: 'combobox',
	                valueField: 'group_id',
	                displayField: 'group_name',
			forceSelection: true,
			queryMode: 'remote',
			store: profileStore,
			width: 300
	    }]
	},

	// SPRI specific fields
	{ name: 'ticket_file',		xtype: 'hiddenfield' },
	{ name: 'ticket_area',		xtype: 'hiddenfield' },
	{ name: 'ticket_program_id',	xtype: 'hiddenfield' },
	{ name: 'ticket_service_id',	xtype: 'hiddenfield' },

	// Additional fields to add later
	{ name: 'ticket_assignee_id',		xtype: 'hiddenfield'},
	{ name: 'ticket_dept_id',		xtype: 'hiddenfield'},
	{ name: 'ticket_hardware_id',		xtype: 'hiddenfield'},
	{ name: 'ticket_application_id',	xtype: 'hiddenfield'},
	{ name: 'ticket_alarm_date',		xtype: 'hiddenfield'},
	{ name: 'ticket_alarm_action',		xtype: 'hiddenfield'},
	{ name: 'ticket_note',			xtype: 'hiddenfield'},
	{ name: 'ticket_conf_item_id',		xtype: 'hiddenfield'},
	{ name: 'ticket_component_id',		xtype: 'hiddenfield'},
	{ name: 'ticket_description',		xtype: 'hiddenfield'},
	{ name: 'ticket_customer_deadline', 	xtype: 'hiddenfield'},
	],

	buttons: [{
            text: '#intranet-sencha-ticket-tracker.button_Save#',
            disabled: false,
            formBind: true,
	    handler: function(){
		var form = this.up('form').getForm();

		// find out the ticket_id
                var ticket_id_field = form.findField('ticket_id');
                var ticket_id = ticket_id_field.getValue();

		// Set certain ticket dates depending on the status
                var ticket_status_field = form.findField('ticket_status_id');
                var ticket_status_id = parseInt(ticket_status_field.getValue());
		
		var today = '<%= [db_string date "select to_char(now(), \'YYYY-MM-DD\')"] %>';
		switch (ticket_status_id) {
			case 30001:		// closed
			case 30022:		// sign-off
			case 30096:		// resolved
		                form.findField('ticket_done_date').setValue(today);
				break;
		};

		// Set escalation_date once the tickt is reassinged to a queue
                var ticket_queue_field = form.findField('ticket_queue_id');
		var ticket_esc_date_field = form.findField('ticket_escalation_date');
                var ticket_queue_id = parseInt(ticket_queue_field.getValue());
		var ticket_esc_date = ticket_esc_date_field.getValue();
		if (ticket_esc_date == null && ticket_queue_id != null) {
			form.findField('ticket_escalation_date').setValue(today);
		}

		// Write form values into the store
		var values = form.getFieldValues();
		var ticket_record = ticketStore.findRecord('ticket_id',ticket_id);
		var value;
		for(var field in values) {
			if (values.hasOwnProperty(field)) {
				value = values[field];
				if (value == null) { value = ''; }
				ticket_record.set(field, value);
			}
		}
	
		// Tell the store to update the server via it's REST proxy
		ticketStore.sync();

		// Update this and the other ticket forms
		var compoundPanel = Ext.getCmp('ticketCompoundPanel');
		compoundPanel.loadTicket(ticket_record);

	    }
	}],

	loadTicket: function(rec){
                var form = this.getForm();
		this.loadRecord(rec);
	},

	// Somebody pressed the "New Ticket" button:
	// Prepare the form for entering a new ticket
	newTicket: function() {
                var form = this.getForm();
                form.reset();

		// Pre-set the creation date
		var creation_date = '<%= [db_string date "select to_char(now(), \'YYYY-MM-DD\')"] %>';
		form.findField('ticket_creation_date').setValue(name);
	}
});

