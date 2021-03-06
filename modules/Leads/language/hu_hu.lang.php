<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
/*********************************************************************************
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2012 SugarCRM Inc.
 * 
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 * 
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 * 
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 * 
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo. If the display of the logo is not reasonably feasible for
 * technical reasons, the Appropriate Legal Notices must display the words
 * "Powered by SugarCRM".
 ********************************************************************************/

/*********************************************************************************

* Description:  Defines the English language pack for the base application.
* Portions created by SugarCRM are Copyright (C) SugarCRM, Inc.
* All Rights Reserved.
* Contributor(s): ______________________________________..
********************************************************************************/

$mod_strings = array (
    //DON'T CONVERT THESE THEY ARE MAPPINGS
    'db_last_name' => 'LBL_LIST_LAST_NAME',
    'db_first_name' => 'LBL_LIST_FIRST_NAME',
    'db_title' => 'LBL_LIST_TITLE',
    'db_email1' => 'LBL_LIST_EMAIL_ADDRESS',
    'db_account_name' => 'LBL_LIST_ACCOUNT_NAME',
    'db_email2' => 'LBL_LIST_EMAIL_ADDRESS',

    //END DON'T CONVERT
    'ERR_DELETE_RECORD' => 'Adatszám szükséges a Megkeresés törléséhez.',
    'LBL_ACCOUNT_DESCRIPTION'=> 'Cég leírása',
    'LBL_ACCOUNT_ID'=>'Cég ID',
    'LBL_ACCOUNT_NAME' => 'Cég neve:',
    'LBL_ACTIVITIES_SUBPANEL_TITLE'=>'Aktivitások',
    'LBL_ADD_BUSINESSCARD' => 'Névjegy hozzáadása',
    'LBL_ADDRESS_INFORMATION' => 'Cím info',
    'LBL_ALT_ADDRESS_CITY' => 'Alternatív cím, város',
    'LBL_ALT_ADDRESS_COUNTRY' => 'Alternatív cím, ország',
    'LBL_ALT_ADDRESS_POSTALCODE' => 'Alternatív cím, irányítószám',
    'LBL_ALT_ADDRESS_STATE' => 'Alternatív cím, állam',
    'LBL_ALT_ADDRESS_STREET_2' => 'Alternatív cím 2',
    'LBL_ALT_ADDRESS_STREET_3' => 'Alternatív cím 3',
    'LBL_ALT_ADDRESS_STREET' => 'Alternatív cím',
    'LBL_ALTERNATE_ADDRESS' => 'Egyéb cím:',
    'LBL_ALT_ADDRESS' => 'Egyéb cím:',
    'LBL_ANY_ADDRESS' => 'Más cím:',
    'LBL_ANY_EMAIL' => 'Más email:',
    'LBL_ANY_PHONE' => 'Más telefon:',
    'LBL_ASSIGNED_TO_NAME' => 'Hozzárendelve',
    'LBL_ASSIGNED_TO_ID' => 'Hozzárendelt felhasználó:',
    'LBL_BACKTOLEADS' => 'Vissza a megkeresésekhez',
    'LBL_BUSINESSCARD' => 'Megkeresés konvertálása',
    'LBL_CITY' => 'Város:',
    'LBL_CONTACT_ID' => 'Kapcsolat ID',
    'LBL_CONTACT_INFORMATION' => 'Áttekintés',
    'LBL_CONTACT_NAME' => 'Megkeresés neve:',
    'LBL_CONTACT_OPP_FORM_TITLE' => 'Megkeresés-lehetőség:',
    'LBL_CONTACT_ROLE' => 'Szerepkör:',
    'LBL_CONTACT' => 'Megkeresés:',
    'LBL_CONVERTED_ACCOUNT'=>'Konvertált cég:',
    'LBL_CONVERTED_CONTACT' => 'Konvertált kapcsolat:',
    'LBL_CONVERTED_OPP'=>'Konvertált lehetőség:',
    'LBL_CONVERTED'=> 'Konvertálva',
    'LBL_CONVERTLEAD_BUTTON_KEY' => 'V',
    'LBL_CONVERTLEAD_TITLE' => 'Megkeresés konvertálása',
    'LBL_CONVERTLEAD' => 'Megkeresés konvertálása',
    'LBL_CONVERTLEAD_WARNING' => 'Figyelem: Konvertálva állapotra szeretné változtatni a megkeresést. A Kapcsolat vagy Cég adatai a Megkeresésből kerülnek létrehozásra. Ha folytatni szeretné, válassza a Mentés opciót, ha nem, válassza a Mégsét.',
    'LBL_CONVERTLEAD_WARNING_INTO_RECORD' => ' Lehetséges kapcsolat: ',
    'LBL_COUNTRY' => 'Ország:',
    'LBL_CREATED_NEW' => 'Új létrehozva',
	'LBL_CREATED_ACCOUNT' => 'Új cég létrehozva',
    'LBL_CREATED_CALL' => 'Új hívás létrehozva',
    'LBL_CREATED_CONTACT' => 'Új kapcsolat létrehozva',
    'LBL_CREATED_MEETING' => 'Új találkozó létrehozva',
    'LBL_CREATED_OPPORTUNITY' => 'Új lehetőség létrehozva',
    'LBL_DEFAULT_SUBPANEL_TITLE' => 'Megkeresések',
    'LBL_DEPARTMENT' => 'Részleg:',
    'LBL_DESCRIPTION_INFORMATION' => 'Leíró info',
    'LBL_DESCRIPTION' => 'Leírás:',
    'LBL_DO_NOT_CALL' => 'Nem hívható:',
    'LBL_DUPLICATE' => 'Hasonló megkeresések',
    'LBL_EMAIL_ADDRESS' => 'Email:',
    'LBL_EMAIL_OPT_OUT' => 'Leíratkozott email:',
    'LBL_EXISTING_ACCOUNT' => 'Meglévő cég használata',
    'LBL_EXISTING_CONTACT' => 'Meglévő kapcsolat használata',
    'LBL_EXISTING_OPPORTUNITY' => 'Meglévő lehetőség használata',
    'LBL_FAX_PHONE' => 'Fax:',
    'LBL_FIRST_NAME' => 'Keresztnév:',
    'LBL_FULL_NAME' => 'Teljes név:',
    'LBL_HISTORY_SUBPANEL_TITLE'=>'Előzmény',
    'LBL_HOME_PHONE' => 'Otthoni telefon:',
    'LBL_IMPORT_VCARD' => 'vCard importálása',
    'LBL_VCARD' => 'vCard',
    'LBL_IMPORT_VCARDTEXT' => 'A fájlrendszerből importált vCardok automatikusan Megkeresést hoznak létre.',
    'LBL_INVALID_EMAIL'=>'Érvénytelen email:',
    'LBL_INVITEE' => 'Közvetlen riportok',
    'LBL_LAST_NAME' => 'Vezetéknév:',
    'LBL_LEAD_SOURCE_DESCRIPTION' => 'Megkeresési forrás leírása:',
    'LBL_LEAD_SOURCE' => 'Megkeresés forrása:',
    'LBL_LIST_ACCEPT_STATUS' => 'Elfogadás állapota',
    'LBL_LIST_ACCOUNT_NAME' => 'Cégnév',
    'LBL_LIST_CONTACT_NAME' => 'Megkeresés neve',
    'LBL_LIST_CONTACT_ROLE' => 'Szerepkör',
    'LBL_LIST_DATE_ENTERED' => 'Létrehozás dátuma',
    'LBL_LIST_EMAIL_ADDRESS' => 'Email',
    'LBL_LIST_FIRST_NAME' => 'Keresztnév',
    'LBL_VIEW_FORM_TITLE' => 'Megkeresés nézet',    
    'LBL_LIST_FORM_TITLE' => 'Megkeresés lista',
    'LBL_LIST_LAST_NAME' => 'Vezetéknév',
    'LBL_LIST_LEAD_SOURCE_DESCRIPTION' => 'Megkeresési forrás leírása',
    'LBL_LIST_LEAD_SOURCE' => 'Megkeresés forrása',
    'LBL_LIST_MY_LEADS' => 'Megkereséseim',
    'LBL_LIST_NAME' => 'Név',
    'LBL_LIST_PHONE' => 'Irodai telefon',
    'LBL_LIST_REFERED_BY' => 'Rá hivatkozva',
    'LBL_LIST_STATUS' => 'Állapot',
    'LBL_LIST_TITLE' => 'Cím',
    'LBL_MOBILE_PHONE' => 'Mobil:',
    'LBL_MODULE_NAME' => 'Megkeresések',
    'LBL_MODULE_TITLE' => 'Megkeresések: Kezdőlap',
    'LBL_NAME' => 'Név:',
    'LBL_NEW_FORM_TITLE' => 'Új megkeresés',
    'LBL_NEW_PORTAL_PASSWORD' => 'Új portál jelszó:',
    'LBL_OFFICE_PHONE' => 'Irodai telefon:',
    'LBL_OPP_NAME' => 'Lehetőség neve:',
    'LBL_OPPORTUNITY_AMOUNT' => 'Lehetőség összege:',
    'LBL_OPPORTUNITY_ID'=>'Lehetőség ID',
    'LBL_OPPORTUNITY_NAME' => 'Lehetőség neve:',
    'LBL_OTHER_EMAIL_ADDRESS' => 'Egyéb email:',
    'LBL_OTHER_PHONE' => 'Egyéb telefon:',
    'LBL_PHONE' => 'Telefon:',
    'LBL_PORTAL_ACTIVE' => 'Portál aktív:',
    'LBL_PORTAL_APP'=> 'Portál alkalmazás',
    'LBL_PORTAL_INFORMATION' => 'Portál info',
    'LBL_PORTAL_NAME' => 'Portál neve:',
    'LBL_PORTAL_PASSWORD_ISSET' => 'Portál jelszó beállítva:',
    'LBL_POSTAL_CODE' => 'Irányítószám:',
    'LBL_STREET' => 'Utca',
    'LBL_PRIMARY_ADDRESS_CITY' => 'Elsődleges cím, város',
    'LBL_PRIMARY_ADDRESS_COUNTRY' => 'Elsődleges cím, ország',
    'LBL_PRIMARY_ADDRESS_POSTALCODE' => 'Elsődleges cím, irányítószám',
    'LBL_PRIMARY_ADDRESS_STATE' => 'Elsődleges cím, állam',
    'LBL_PRIMARY_ADDRESS_STREET_2'=>'Elsődleges cím 2',
    'LBL_PRIMARY_ADDRESS_STREET_3'=>'Elsődleges cím 3',   
    'LBL_PRIMARY_ADDRESS_STREET' => 'Elsődleges cím',
    'LBL_PRIMARY_ADDRESS' => 'Elsődleges cím',
    'LBL_REFERED_BY' => 'Rá hivatkozva:',
    'LBL_REPORTS_TO_ID'=>'Jelentést tesz ID',
    'LBL_REPORTS_TO' => 'Jelentést tesz:',
    'LBL_REPORTS_FROM' => 'Jelentést kap:',
    'LBL_SALUTATION' => 'Megszólítás',
    'LBL_MODIFIED'=>'Módosító',
	'LBL_MODIFIED_ID'=>'Módosító Id',
	'LBL_CREATED'=>'Létrehozó',
	'LBL_CREATED_ID'=>'Létrehozó Id',    
    'LBL_SEARCH_FORM_TITLE' => 'Megkeresés keresése',
    'LBL_SELECT_CHECKED_BUTTON_LABEL' => 'Megizsgált megkeresések kijelölése',
    'LBL_SELECT_CHECKED_BUTTON_TITLE' => 'Megizsgált megkeresések kijelölése',
    'LBL_STATE' => 'Állam:',
    'LBL_STATUS_DESCRIPTION' => 'Állapot leírása:',
    'LBL_STATUS' => 'Állapot:',
    'LBL_TITLE' => 'Beosztás:',
    'LNK_IMPORT_VCARD' => 'Megkeresés létrehozása vCard-ból',
    'LNK_LEAD_LIST' => 'Megkeresések megtekintése',
    'LNK_NEW_ACCOUNT' => 'Cég létrehozása',
    'LNK_NEW_APPOINTMENT' => 'Megbeszélés létrehozása',
    'LNK_NEW_CONTACT' => 'Kapcsolat létrehozása',
    'LNK_NEW_LEAD' => 'Megkeresés létrehozása',
    'LNK_NEW_NOTE' => 'Jegyzet létrehozása',
    'LNK_NEW_TASK' => 'Feladat létrehozása',
    'LNK_NEW_CASE' => 'Eset létrehozása',
    'LNK_NEW_CALL' => 'Hívás rögzítése',
    'LNK_NEW_MEETING' => 'Találkozó ütemezése',
    'LNK_NEW_OPPORTUNITY' => 'Lehetőség létrehozása',
    'LNK_SELECT_ACCOUNT' => ' <b>VAGY</b> Cég kiválasztása',
	'LNK_SELECT_ACCOUNTS' => ' <b>VAGY</b> Cég kiválasztása',
    'NTC_COPY_ALTERNATE_ADDRESS' => 'Alternatív cím másolása az elsődleges címbe',
    'NTC_COPY_PRIMARY_ADDRESS' => 'Elsődleges cím másolása az alternatív címbe',
    'NTC_DELETE_CONFIRMATION' => 'Biztosan törölni szeretné ezt az adatot?',
    'NTC_OPPORTUNITY_REQUIRES_ACCOUNT' => 'A Lehetőség létrehozásához Cég megadása szükséges.\n Kérem hozzon létre új céget, vagy válasszon a meglévők közül.',
    'NTC_REMOVE_CONFIRMATION' => 'Biztosan eltávolítja a Megkeresés és az Eset kapcsolatát?',
    'NTC_REMOVE_DIRECT_REPORT_CONFIRMATION' => 'Biztosan eltávolítja az adatot a közvetlen riportból?',
    'LBL_CAMPAIGN_LIST_SUBPANEL_TITLE'=>'Kampányok',
    'LBL_TARGET_OF_CAMPAIGNS'=>'Sikeres kampányok:',
    'LBL_TARGET_BUTTON_LABEL'=>'Célpont',
    'LBL_TARGET_BUTTON_TITLE'=>'Célpont',
    'LBL_TARGET_BUTTON_KEY'=>'T',
    'LBL_CAMPAIGN_ID'=>'Kampány Id',
    'LBL_CAMPAIGN' => 'Kampány:',
  	'LBL_LIST_ASSIGNED_TO_NAME' => 'Hozzárendelt felhasználó',
    'LBL_PROSPECT_LIST' => 'Célpont lista',
    'LBL_CAMPAIGN_LEAD' => 'Kampányok',
    'LBL_BIRTHDATE' => 'Születésnap:',
    'LBL_THANKS_FOR_SUBMITTING_LEAD' =>'Köszönjük a közreműködését.',
    'LBL_SERVER_IS_CURRENTLY_UNAVAILABLE' =>'Sajnálom, a szerver jelenleg nem elérhető. Kérem próbálja meg később.',
    'LBL_ASSISTANT_PHONE' => 'Asszisztens telefon',
    'LBL_ASSISTANT' => 'Asszisztens',
    'LBL_REGISTRATION' => 'Regisztráció',
    'LBL_MESSAGE' => 'Kérem írja be az információkat alulra. Az információ és/vagy a Cég a jóváhagyást követően létrejön.',
    'LBL_SAVED' => 'Köszönjük a regisztrációt. A fiókja létrejött, munkatársunk hamarosan felveszi Önnel a kapcsolatot.', 
    'LBL_CLICK_TO_RETURN' => 'Visszatérés a portálhoz',
    'LBL_CREATED_USER' => 'Létrehozó felhasználó',
    'LBL_MODIFIED_USER' => 'Módosító felhasználó',
    'LBL_CAMPAIGNS' => 'Kampányok',
    'LBL_CAMPAIGNS_SUBPANEL_TITLE' => 'Kampányok',
    'LBL_CONVERT_MODULE_NAME' => 'Modul',
    'LBL_CONVERT_REQUIRED' => 'Szükséges',
    'LBL_CONVERT_SELECT' => 'Megengedett kiválasztás',
    'LBL_CONVERT_COPY' => 'Adatmásolás',
    'LBL_CONVERT_EDIT' => 'Szerkesztés',
    'LBL_CONVERT_DELETE' => 'Törlés',
    'LBL_CONVERT_ADD_MODULE' => 'Modul hozzáadása',
    'LBL_CREATE' => 'Létrehozás',
    'LBL_SELECT' => ' <b>VAGY</b> Kiválasztás',
	'LNK_SELECT_CONTACTS' => ' <b>VAGY</b> Kapcsolat kiválasztása',
	'LBL_WEBSITE' => 'Weboldal',
	'LNK_IMPORT_LEADS' => 'Megkeresések importálása',
	'LBL_NOTICE_OLD_LEAD_CONVERT_OVERRIDE' => 'Értesítés: A Megkeresés konvertálása képernyő egyedi mezőket tartalmaz. A Studióban az egyedi mezők létrehozásánál hozzá kell adni az elrendezéshez is. Az elrendezéshez való hozzáadás nem automatikus, ezért lehet, hogy rejtve marad a létrehozott egyedi mező.',
//Convert lead tooltips
	'LBL_MODULE_TIP' 	=> 'A modulban egy új adat van.',
	'LBL_REQUIRED_TIP' 	=> 'A létrehozni kívánt objektumokat ki kell választani, vagy létre kell hozni a konvertálás előtt.',
	'LBL_COPY_TIP'		=> 'Ha ki van választva, a Megkeresés adatai és elnevezései másolva lesznek az újonnan létrehozott objektumokba.',
	'LBL_SELECTION_TIP' => 'Választható, hogy a Megkeresés kovertálásakor az adatok ne kerüljenek rögzítésre a Kapcsolat mezőibe.',
	'LBL_EDIT_TIP'		=> 'Módosíthatja a kovertálás elrendezését a modulban.',
	'LBL_DELETE_TIP'	=> 'Eltávolíthatja ezt a modult a konvertálási elrendezésből.',

    'LBL_ACTIVITIES_MOVE'   => 'Aktivitások áthelyezése',
    'LBL_ACTIVITIES_COPY'   => 'Aktivitások másolása',
    'LBL_ACTIVITIES_MOVE_HELP'   => "Válassza ki melyik adatot szeretné áthelyezni a Megkeresés aktivitásaiba. Feladatok, találkozók, hívások, jegyzetek és emailek áthelyezésre kerülnek a kiválasztott objektumokhoz.",
    'LBL_ACTIVITIES_COPY_HELP'   => "Válassza ki az adatokat, amelyeket a Megkeresés aktivitásaihoz szeretne átmásolni. Új feladatok, hívások, találkozók, jegyzetek kerülnek átmásolásra a kiválasztott objektumokhoz. Az emailek kapcsolódni fognak a kiválasztott objektumokhoz.",
    //For export labels
    'LBL_PHONE_HOME' => 'Otthoni telefon',
    'LBL_PHONE_MOBILE' => 'Mobil',
    'LBL_PHONE_WORK' => 'Irodai telefon',
    'LBL_PHONE_OTHER' => 'Egyéb telefon',
    'LBL_PHONE_FAX' => 'Fax',
    'LBL_CAMPAIGN_ID' => 'Kampány ID',
    'LBL_EXPORT_ASSIGNED_USER_NAME' => 'Hozzárendelt felhasználó neve',
    'LBL_EXPORT_ASSIGNED_USER_ID' => 'Hozzárendelt felhasználó ID',
    'LBL_EXPORT_MODIFIED_USER_ID' => 'Módosító ID',
    'LBL_EXPORT_CREATED_BY' => 'Létrehozó ID',
    'LBL_EXPORT_PHONE_MOBILE' => 'Mobil',
    'LBL_EXPORT_EMAIL2'=>'Egyéb email',
	'LBL_EDITLAYOUT' => 'Elrendezés szerkesztése' /*for 508 compliance fix*/,
	'LBL_ENTERDATE' => 'Bevitel dátuma' /*for 508 compliance fix*/,
	'LBL_LOADING' => 'Töltés' /*for 508 compliance fix*/,
	'LBL_EDIT_INLINE' => 'Szerkesztés' /*for 508 compliance fix*/,
);
?>
