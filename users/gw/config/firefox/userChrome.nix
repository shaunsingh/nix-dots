''
/* change these variables to get different colors */
#tabbrowser-tabs {
	--tab-active-color: #24283b;
	--tab-inactive-color: #1e2030;
	--tab-fallback-color-active: #1e2030;
	--tab-fallback-color-inactive: #24283b;
	--identityicon-color: #a9b1d6
}

/* change to control tabbar height */
/* try increasing to 20px if you see a black line under tabbar */
#titlebar { --tab-min-height: 30px !important; }

/* --- GENERAL DEBLOAT ---------------------------------- */

/* Bottom left page loading status or url preview */
#statuspanel { display: none !important; }

/* --- DEBLOAT NAVBAR ----------------------------------- */

#back-button 		{ display: none; }
#forward-button { display: none; }
#reload-button 	{ display: none; }
#stop-button 		{ display: none; }
#home-button 		{ display: none; }
/* #downloads-button { display: none; } */
#library-button { display: none; }
#fxa-toolbar-menu-button { display: none; }

/* Empty space before and after the url bar */
#customizableui-special-spring1,
#customizableui-special-spring2 { display: none; }

#nav-bar,
#navigator-toolbox {
	border-width: 0 !important;
	--toolbar-field-focus-border-color: #414868;
}

/* --- STYLE URLBAR ------------------------------------- */

#urlbar-container {
	--urlbar-container-height: var(--tab-min-height) !important;
	margin-left: 0 !important;
	margin-right: 0 !important;
	padding-top: 0 !important;
	padding-bottom: 0 !important;
	font-family: 'CaskaydiaCove Nerd Font', monospace;
	font-size: 12px;
}

#urlbar {
	--urlbar-height: 				 var(--tab-min-height) !important;
	--urlbar-toolbar-height: var(--tab-min-height) !important;
	min-height: 						 var(--tab-min-height) !important;
	border-color: var(--lwt-toolbar-field-border-color, hsla(240,5%,5%,.25)) !important;
	--autocomplete-popup-highlight-background: transparent !important;
}

#urlbar-background {
	border-width: 0 !important;
	border-radius: 0 !important;
	background: #24283b !important;
}

#urlbar-input-container {
	border-width: 0 !important;
	margin-left: 1em !important;
}

#urlbar-input {
	margin-left: 0.4em !important;
	margin-right: 0.4em !important;
}

.urlbarView-row {
	padding-top: 0 !important;
	padding-bottom: 0 !important;
	line-height: var(--urlbar-height) !important;
}

.urlbarView-row-inner {
	padding-top: 0.3em !important;
	padding-bottom: 0.3em !important;
	height: var(--urlbar-height) !important;
}

.urlbarView-favicon {
	height: 1em !important;
	width: 1em !important;
	margin-bottom: 0.2em !important;
}

/* --- DEBLOAT URLBAR ----------------------------------- */

#identity-box 			{ display: none; }
#pageActionButton 	{ display: none; }
#pocket-button 			{ display: none; }
#urlbar-zoom-button { display: none; }
#star-button 				{ display: none; }
#reader-mode-button	{ display: none !important; }
#tracking-protection-icon-container { display: none !important; }

/* this will remove the invisible box at the end of urlbar but also will
 * disable the Ctrl+D shortcut */
#star-button-box 	{ display: none; }

/* Go to arrow button at the end of the urlbar when searching */
#urlbar-go-button { display: none; }

/* remove container indicator from urlbar */
#userContext-label, #userContext-indicator { display: none !important;}

/* --- STYLE TAB TOOLBAR -------------------------------- */

#titlebar {
	--proton-tab-block-margin: 0px !important;
	--tab-block-margin: 0 !important;
}

:root:not([customizing]) #TabsToolbar{
	background-color: #24283b;
}

:root:not([customizing]) #navigator-toolbox {
	background-color: #24283b !important;
}

#TabsToolbar, .tabbrowser-tab {
	max-height: var(--tab-min-height) !important;
	font-size: 	11px !important;
}

/* Change color of normal tabs */
tab:not([selected="true"]) {
	background-color: var(--tab-inactive-color) !important;
	color: var(--tab-fallback-color-active) !important;
}

.tab-text.tab-label{
       font-size: 13px;
}       

tab {
	font-family: 'CaskaydiaCove Nerd Font', "Regular";
	font-weight: Regular;
	border: none !important;
}

/* safari style tab width */
.tabbrowser-tab[fadein] { max-width: 100vw !important; border: none }

/* Hide close button on tabs */
#tabbrowser-tabs .tabbrowser-tab .tab-close-button { display: none !important; }

/* hide container line on tab*/
#tabbrowser-tabs .tab-context-line { display: none }

/* disable favicons in tab */
.tab-icon-stack:not([pinned]) { display: none !important; }

.tabbrowser-tab {
	/* remove border between tabs */
	padding-inline: 0px !important;
	/* remove fading effect from tab text */
	--tab-label-mask-size: 1em !important;
	/* fix pinned tab behaviour on overflow */
	overflow-clip-margin: 0px !important;
}

/* remove min-height from tabs toolbar (needed for fullscreen one tab) */
#TabsToolbar,
#tabbrowser-tabs,
#tabbrowser-tabs > .tabbrowser-arrowscrollbox,
#tabbrowser-arrowscrollbox { min-height: 0 !important; }

/* Tab: selected colors */
#tabbrowser-tabs .tabbrowser-tab[selected] .tab-content {
	background: var(--tab-active-color) !important;
	border: none !important;
	color: var(--identityicon-color) !important;
}

/* Tab: hovered colors */
#tabbrowser-tabs .tabbrowser-tab:hover:not([selected]) .tab-content {
	background: var(--identityicon-color) !important;
}
/* remove white margin around active tabs */
#tabbrowser-tabs:not([movingtab]) > #tabbrowser-arrowscrollbox > .tabbrowser-tab[beforeselected-visible]::after,
#tabbrowser-tabs[movingtab] > #tabbrowser-arrowscrollbox > .tabbrowser-tab[visuallyselected]::before,
.tabbrowser-tab[visuallyselected]::after { border: none !important; }

/*AGENT_SHEET*/
#main-window #navigator-toolbox #TabsToolbar:not(:-moz-lwtheme) { background: var(--tab-active-color) !important; }

/* hide window controls */
.titlebar-buttonbox-container { display: none; }

/* remove titlebar spacers */
.titlebar-spacer { display: none !important; }

/* disable tab shadow */
#tabbrowser-tabs:not([noshadowfortests]) .tab-background:is([selected], [multiselected]) {
    box-shadow: none !important;
}

/* remove dark space between pinned tab and first non-pinned tab */
#tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs]) > #tabbrowser-arrowscrollbox > .tabbrowser-tab[first-visible-unpinned-tab] {
	margin-inline-start: 0px !important;
}

/* remove dropdown menu button which displays all tabs on overflow */
#alltabs-button { display: none !important }

/* fix displaying of pinned tabs on overflow */
#tabbrowser-tabs:not([secondarytext-unsupported]) .tab-label-container {
	height: var(--tab-min-height) !important;
}

/* remove overflow scroll buttons */
#scrollbutton-up,
#scrollbutton-down {
	display: none !important;
}

.tabbrowser-tab:not([selected]) .tab-content{
	    color: #414868 !important;
}
/* --- AUTOHIDE URLBAR ---------------------------------- */

/* hide urlbar unless focused */
#nav-bar {
	min-height: 0 !important;
	max-height: 0 !important;
	height: 0 !important;
	--moz-transform: scaleY(0) !important;
	transform: scaleY(0) !important;
}

/* #titlebar:hover~#nav-bar, */
/* #nav-bar:hover, */
#nav-bar:focus-within {
	--moz-transform: scale(1) !important;
	transform: scale(1) !important;
	max-height: var(--urlbar-height) !important;
	height: var(--urlbar-height) !important;
	min-height: var(--urlbar-height) !important;
}
.overflow-button {
	background: #1e2030 !important;
}
#PanelUI-menu-button {
	background: #1e2030 !important;
}
/* show on toolbox hover */
/* #titlebar:hover ~ .browser-toolbar, */
/* #nav-bar:hover, */
/* #nav-bar:hover + #PersonalToolbar { */
/* 	transform: translateY(0); */
/* 	opacity: 1; */
/* } */
''
