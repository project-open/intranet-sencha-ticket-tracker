/**
 * intranet-sencha-ticket-tracker/www/TicketContainer.js
 * Container for both TicketGrid and TicketForm.
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


var ticketCompountPanel = Ext.define('TicketBrowser.TicketCompoundPanel', {
    extend:	'Ext.container.Container',
    alias:	'widget.ticketCompoundPanel',
    // No id: This is not a singleton object
    id:		'ticketCompoundPanel',
    title:  'Loading...',
    layout: 'border',
    deferredRender: false,

    items: [{
	itemId:	'center',
	region: 'center',
	layout: 'anchor',
	width:	400,

	items: [{
		itemId: 'ticketForm',
		xtype: 'ticketForm',
		title: '#intranet-core.Ticket#'
	}, {
		itemId: 'ticketCustomer',
		title: '#intranet-core.Customer#',
		xtype: 'ticketCustomer'
	}, {
		itemId: 'ticketContact',
		title: '#intranet-core.Contact#',
		xtype: 'ticketContactPanel'
	}, {
		itemId: 'ticketFilestorage',
		title: '#intranet-filestorage.Filestorage#',
		xtype: 'fileStorageGrid'
	}]
    }, {
	itemId:	'east',
	region: 'east',
	layout:	'anchor',
	width:	1000,

	items: [{
		itemId: 'ticketFormRight',
		title: '',
		xtype: 'ticketFormRight'
	}]

    }],

    // Called from the TicketGrid if the user has selected a ticket
    loadTicket: function(rec){
        this.child('#center').child('#ticketForm').loadTicket(rec);
        this.child('#center').child('#ticketContact').loadTicket(rec);
        this.child('#center').child('#ticketCustomer').loadTicket(rec);
        this.child('#center').child('#ticketFilestorage').loadTicket(rec);
        this.child('#east').child('#ticketFormRight').loadTicket(rec);
    }

});


