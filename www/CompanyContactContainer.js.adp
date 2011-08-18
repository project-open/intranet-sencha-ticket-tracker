/**
 * intranet-sencha-ticket-tracker/www/Main.js
 * Container for Companies and contacts.
 *
 * @author David Blanco (david.blanco@grupoversia.com)
 * @creation-date 2011-08
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
 
 
Ext.define('TicketBrowser.CompanyContactContainer', {
	extend: 'Ext.container.Container',
	alias: 'widget.companyContactContainer',
	layout: 'border',
	
	items: [{
		itemID:	'companyPanel',
		xtype:	'companyPanel',
		split:	true,
		region: 'center'
	}, {
		itemID:	'contactPanel',
		xtype:	'contactPanel',
		split:	true,
		height: 400,
		region: 'south'		
	}]
});