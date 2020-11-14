# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

from colors import colors

def get_color(color):
    return colors.get(color)

# Aliases for commands.
my_aliases = {
    'emacs_source': "spawn --userscript view_source",
}

c.aliases.update(my_aliases)

# How often (in milliseconds) to auto-save config/cookies/etc.
c.auto_save.interval = 2147483647

# Always restore open sites when qutebrowser is reopened.
c.auto_save.session = False

# The backend to use to display websites.
c.backend = "webengine"

# Keybindings mapping keys to commands in different modes.
c.bindings.commands = c.bindings.commands

# Default keybindings. If you want to add bindings, modify bindings.commands instead.
c.bindings.default = c.bindings.default

# This setting can be used to map keys to other keys.
c.bindings.key_mappings = c.bindings.key_mappings

# Background color of the completion widget category headers.
c.colors.completion.category.bg = get_color('BG')

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = get_color('magenta')

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = get_color('magenta')

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = get_color('magenta')

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = get_color('BG')

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = get_color('BG')

# Text color of the completion widget.
c.colors.completion.fg = [get_color('FG'), get_color('green'), get_color('red')]

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = get_color('BG')

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = get_color('cyan')

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = get_color('cyan')

# Top border color of the completion widget category headers.
c.colors.completion.item.selected.border.top = get_color('cyan')

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = get_color('red')

# Color of the scrollbar in completion view
c.colors.completion.scrollbar.bg = get_color('BG')

# Color of the scrollbar handle in completion view.
c.colors.completion.scrollbar.fg = get_color('FG')

# Background color for the download bar.
c.colors.downloads.bar.bg = get_color('BG')

# Background color for downloads with errors.
c.colors.downloads.error.bg = get_color('red')

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = get_color('BG')

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = get_color('blue')

# Color gradient start for download text.
c.colors.downloads.start.fg = get_color('BG')

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = get_color('green')

# Color gradient end for download text.
c.colors.downloads.stop.fg = get_color('BG')

# Color gradient interpolation system for download backgrounds.
c.colors.downloads.system.bg = "rgb"

# Color gradient interpolation system for download text.
c.colors.downloads.system.fg = "rgb"

# Background color for hints.
c.colors.hints.bg = get_color('BG')

# Font color for hints.
c.colors.hints.fg = get_color('green')

# Font color for the matched part of hints.
c.colors.hints.match.fg = get_color('BG')

# Background color of the keyhint widget.
c.colors.keyhint.bg = get_color('BG')

# Text color for the keyhint widget.
c.colors.keyhint.fg = get_color('white')

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = get_color('yellow')

# Background color of an error message.
c.colors.messages.error.bg = get_color('BG')

# Border color of an error message.
c.colors.messages.error.border = get_color('red')

# Foreground color of an error message.
c.colors.messages.error.fg = get_color('red')

# Background color of an info message.
c.colors.messages.info.bg = get_color('BG')

# Border color of an info message.
c.colors.messages.info.border = get_color('green')

# Foreground color an info message.
c.colors.messages.info.fg = get_color('green')

# Background color of a warning message.
c.colors.messages.warning.bg = get_color('BG')

# Border color of a warning message.
c.colors.messages.warning.border = get_color('orange')

# Foreground color a warning message.
c.colors.messages.warning.fg = get_color('orange')

# Background color for prompts.
c.colors.prompts.bg = get_color('BG')

# Border used around UI elements in prompts.
c.colors.prompts.border = get_color('white')

# Foreground color for prompts.
c.colors.prompts.fg = get_color('magenta')

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = '#308cc6'

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = get_color('BG')

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = get_color('violet')

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = get_color('BG')

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = get_color('blue')

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = get_color('cyan')

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = get_color('BG')

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = get_color('BG')

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = get_color('cyan')

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = get_color('BG')

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = get_color('green')

# Background color of the statusbar.
c.colors.statusbar.normal.bg = get_color('BG')

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = get_color('violet')

# c.colors.statusbar.passthrough.fg/.bg (I don't know, never used it)

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = get_color('BG')

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = get_color('violet')

# Background color of the progress bar.
c.colors.statusbar.progress.bg = get_color('FG')

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = get_color('red')

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = get_color('FG')

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = get_color('blue')

# Foreground color of the URL in the statusbar on successful load (http).
c.colors.statusbar.url.success.http.fg = get_color('white')

# Foreground color of the URL in the statusbar on successful load (https).
c.colors.statusbar.url.success.https.fg = get_color('orange')

# Foreground color of the URL in the statusbar when there’s a warning.
c.colors.statusbar.url.warn.fg = get_color('yellow')

# Background color of the tab bar.
c.colors.tabs.bar.bg = get_color('SEC')

# Background color of unselected even tabs.
c.colors.tabs.even.bg = get_color('violet')

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = get_color('BG')

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = get_color('violet')

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = get_color('BG')

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = get_color('BG')

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = get_color('violet')

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = get_color('BG')

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = get_color('violet')

# Color gradient interpolation system for the tab indicator.
c.colors.tabs.indicator.system = 'rgb'

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = get_color('red')

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = get_color('blue')

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = get_color('green')

# Background color for webpages if unset (or empty to use the theme’s color)
c.colors.webpage.bg = '#ffffff'

# How many commands to save in the command history.
c.completion.cmd_history_max_items = 0

# There is also completion.delay option and completion.min_chars
c.completion.delay = c.completion.delay
c.completion.min_chars = c.completion.min_chars

# Which categories to show (in which order) in the :open completion.
# c.completion.open_categories =

# The height of the completion, in px or as percentage of the window.
c.completion.height = '50%'

# Move on to the next part when there’s only one possible completion left.
c.completion.quick = True

# Padding of scrollbar handle in the completion window (in px).
c.completion.scrollbar.padding = 0

# Width of the scrollbar in the completion window (in px).
c.completion.scrollbar.width = 0

# When to show the autocompletion window.
c.completion.show = "always"

# Shrink the completion to be smaller than the configured size if there are no scrollbars.
c.completion.shrink = True

# How to format timestamps (e.g. for the history completion).
c.completion.timestamp_format = "%Y-%m-%d"

# another new settings that I currently don't need
c.completion.use_best_match = c.completion.use_best_match

# A list of patterns which should not be shown in the history
c.completion.web_history.exclude = []

# How many URLs to show in the web history.
c.completion.web_history.max_items = 0

# Whether quitting the application requires a confirmation.
c.confirm_quit = c.confirm_quit

# Automatically start playing <video> elements. Note this option needs a restart with QtWebEngine on Qt < 5.11.
c.content.autoplay = False

# Whether support for the HTML 5 web application cache feature is enabled.
# c.content.cache.appcache = # only webkit

# The maximum number of pages to hold in the global memory page cache.
# c.content.cache.maximum_pages = # same as previous

# Size of the HTTP network cache. Null to use the default value.
c.content.cache.size = c.content.cache.size

# Allow websites to read canvas elements. Note this is needed for some websites to work properly. This setting requires a restart.
c.content.canvas_reading = False

# Control which cookies to accept.
c.content.cookies.accept = "no-3rdparty"

# Store cookies.
c.content.cookies.store = False

# Default encoding to use for websites.
c.content.default_encoding = "iso-8859-1"

# Allow websites to share screen content. On Qt < 5.10, a dialog box is always displayed, even if this is set to "true".
c.content.desktop_capture = "ask"

# Try to pre-fetch DNS entries to speed up browsing.
c.content.dns_prefetch = True

# Expand each subframe to its contents.
# c.content.frame_flattening = # webkit only

# Allow websites to request geolocations.
c.content.geolocation = False

# Value to send in the Accept-Language header.
# c.content.headers.accept_language = "en-US,en"
c.content.headers.accept_language = "en-US,en;q=0.5"

# Set custom headers for qutebrowser HTTP requests.
c.content.headers.custom = { "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" }

# Value to send in the DNT header.
c.content.headers.do_not_track = True

# Send the Referer header.
c.content.headers.referer = "same-domain"

# User agent to send. Unset to send the default.
# c.content.headers.user_agent = 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0'
c.content.headers.user_agent = 'Mozilla/5.0 (Windows NT 6.1; rv:52.0) Gecko/20100101 Firefox/52.0'
# Whether host blocking is enabled.
c.content.host_blocking.enabled = True

# List of URLs of lists which contain hosts to block.
c.content.host_blocking.lists = ["https://www.malwaredomainlist.com/hostslist/hosts.txt",
                                 "http://someonewhocares.org/hosts/hosts",
                                 "http://winhelp2002.mvps.org/hosts.zip",
                                 "http://malwaredomains.lehigh.edu/files/justdomains.zip",
                                 "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&mimetype=plaintext"]

# List of domains that should always be loaded, despite being ad-blocked.
c.content.host_blocking.whitelist = []

# Enable or disable hyperlink auditing (<a ping>).
c.content.hyperlink_auditing = False

# Whether images are automatically loaded in web pages.
c.content.images = True

# Show javascript alerts.
c.content.javascript.alert = True

# Whether JavaScript can read from or write to the clipboard.
c.content.javascript.can_access_clipboard = False

# Whether JavaScript can close tabs.
# c.content.javascript.can_close_tabs = # webkit only

# Whether JavaScript can open new tabs without user interaction.
c.content.javascript.can_open_tabs_automatically = False

# Enables or disables JavaScript.
c.content.javascript.enabled = False

# Log levels to use for JavaScript console logging messages.
for key in ("error", "info", "unknown", "warning"):
    c.content.javascript.log[key] = "debug"

# Use the standard JavaScript modal dialog for alert() and confirm()
c.content.javascript.modal_dialog = False

# Show javascript prompts.
c.content.javascript.prompt = True

# Whether locally loaded documents are allowed to access other local urls.
c.content.local_content_can_access_file_urls = True

# Whether locally loaded documents are allowed to access remote urls.
c.content.local_content_can_access_remote_urls = False

# Whether support for HTML 5 local storage and Web SQL is enabled.
c.content.local_storage = False

# Allow websites to lock your mouse pointer
c.content.mouse_lock = "ask"

# Automatically mute tabs
c.content.mute = False

# Location of a netrc-file for HTTP authentication.
c.content.netrc_file = c.content.netrc_file

# Allow websites to show notifications.
# c.content.notifications = # webkit only

# Enable pdf.js to view PDF files in the browser.
c.content.pdfjs = False

# Allow websites to request persistent storage quota via
# navigator.webkitPersistentStorage.requestQuota.
c.content.persistent_storage = "ask"

# Allow websites to register protocol handlers via navigator.registerProtocolHandler.
c.content.register_protocol_handler = "ask"

# Enables or disables plugins in Web pages.
c.content.plugins = False

# Whether the background color and images are also drawn when the page is printed.
c.content.print_element_backgrounds = True

# Open new windows in private browsing mode which does not record visited pages.
c.content.private_browsing = True

# The proxy to use.
c.content.proxy = "system"

# Send DNS requests over the configured proxy.
# c.content.proxy_dns_requests = # webkit only

# Validate SSL handshakes.
c.content.ssl_strict = "ask"

# A list of user stylesheet filenames to use.
c.content.user_stylesheets = ["youtube.css"]

# Enables or disables WebGL.
c.content.webgl = False

# Which interfaces to expose via WebRTC
# Only expose public interfaces via WebRTC. On Qt 5.9, this option
# requires a restart. On Qt 5.10, this option doesn't work at all
# because of a Qt bug. On Qt >= 5.11, no restart is required.
c.content.webrtc_ip_handling_policy = "default-public-interface-only"

# Watch fullscreen video not in a fullscreen window
# c.content.fullscreen.window = c.content.fullscreen.window

# Whether load requests should be monitored for cross-site scripting attempts.
c.content.xss_auditing = False

# The directory to save downloads to.
c.downloads.location.directory = c.downloads.location.directory

# Prompt the user for the download location.
c.downloads.location.prompt = True

# Remember the last used download directory.
c.downloads.location.remember = True

# What to display in the download filename input.
c.downloads.location.suggestion = "path"

# The default program used to open downloads.
c.downloads.open_dispatcher = c.downloads.open_dispatcher

# Where to show the downloaded files.
c.downloads.position = "top"

# Number of milliseconds to wait before removing finished downloads.
c.downloads.remove_finished = 200

# The editor (and arguments) to use for the open-editor command.
c.editor.command = ['emw', '{file}', '+{line}:{column}']

# Encoding to use for the editor.
c.editor.encoding = "utf-8"

c.fonts.default_family = ['Iosevka', 'lucy tewi']

# Font variables
default_font="15pt default_family"
hint_font="bold 18pt default_family"

# Font used in the completion widget.
c.fonts.completion.entry = default_font

# Font used in the completion categories.
c.fonts.completion.category = "bold " + default_font

# Font used for the debugging console.
c.fonts.debug_console = default_font

# Font used for the downloadbar.
c.fonts.downloads = default_font

# Font used for the hints.
c.fonts.hints = hint_font

# Font used in the keyhint widget.
c.fonts.keyhint = default_font

# Font used for error messages.
c.fonts.messages.error = default_font

# Font used for info messages.
c.fonts.messages.info = default_font

# Font used for warning messages.
c.fonts.messages.warning = default_font

# Font used for prompts.
c.fonts.prompts = default_font

# Font used in the statusbar.
c.fonts.statusbar = default_font

# Font used in the tab bar selected.
c.fonts.tabs.selected = "bold " + default_font

# Font used in the tab bar unselected.
c.fonts.tabs.unselected = default_font

# Font family for cursive fonts.
c.fonts.web.family.cursive = c.fonts.web.family.cursive

# Font family for fantasy fonts.
c.fonts.web.family.fantasy = c.fonts.web.family.fantasy

# Font family for fixed fonts.
c.fonts.web.family.fixed = c.fonts.web.family.fixed

# Font family for sans-serif fonts.
c.fonts.web.family.sans_serif = c.fonts.web.family.sans_serif

# Font family for serif fonts.
c.fonts.web.family.serif = c.fonts.web.family.serif

# Font family for standard fonts.
c.fonts.web.family.standard = c.fonts.web.family.standard

# The default font size for regular text.
c.fonts.web.size.default = 16

# The default font size for fixed-pitch text.
c.fonts.web.size.default_fixed = 13

# The hard minimum font size.
c.fonts.web.size.minimum = 0

# The minimum logical font size that is applied when zooming out.
c.fonts.web.size.minimum_logical = 6

# Controls when a hint can be automatically followed without pressing Enter.
c.hints.auto_follow = "unique-match"

# A timeout (in milliseconds) to ignore normal-mode key bindings after a successful auto-follow.
c.hints.auto_follow_timeout = 0

# CSS border value for hints.
c.hints.border = "1px solid " + get_color('white')

# Chars used for hint strings.
c.hints.chars = "aoeuhtns"

# The dictionary file to be used by the word hints.
c.hints.dictionary = "/usr/share/dict/cracklib-small"

# Which implementation to use to find elements to hint.
# c.hints.find_implementation = # webkit only

# Hide unmatched hints in rapid mode.
c.hints.hide_unmatched_rapid_hints = True

# Minimum number of chars used for hint strings.
c.hints.min_chars = 1

# Mode to use for hints.
c.hints.mode = "letter"

# A comma-separated list of regexes to use for next links.
c.hints.next_regexes = c.hints.next_regexes

# A comma-separated list of regexes to use for prev links.
c.hints.prev_regexes = c.hints.prev_regexes

# Scatter hint key chains (like Vimium) or not (like dwb).
c.hints.scatter = True

# Make chars in hint strings uppercase.
c.hints.uppercase = False

# The maximum time in minutes between two history items for them to be considered being from the same browsing session.
c.history_gap_interval = -1

# Forward unbound keys to the webview in normal mode.
c.input.forward_unbound_keys = "auto"

# Leave insert mode if a non-editable element is clicked.
c.input.insert_mode.auto_leave = True

# Automatically enter insert mode if an editable element is focused after loading the page.
c.input.insert_mode.auto_load = False

# Switch to insert mode when clicking flash and other plugins.
c.input.insert_mode.plugins = False

# Include hyperlinks in the keyboard focus chain when tabbing.
c.input.links_included_in_focus_chain = True

# Timeout (in milliseconds) for partially typed key bindings.
c.input.partial_timeout = 1000

# Enable Opera-like mouse rocker gestures.
c.input.mouse.rocker_gestures = False

# Enable Spatial Navigation.
c.input.spatial_navigation = False

# Keychains that shouldn’t be shown in the keyhint dialog.
c.keyhint.blacklist = []

# Time from pressing a key to seeing the keyhint dialog (ms).
c.keyhint.delay = 2000

# Another new setting that I don't need
c.keyhint.radius = c.keyhint.radius

# Time (in ms) to show messages in the statusbar for.
c.messages.timeout = 1500

# How to open links in an existing instance if a new one is launched.
c.new_instance_open_target = "tab-silent"

# Which window to choose when opening links as new tabs.
c.new_instance_open_target_window = "last-focused"

# Show a filebrowser in upload/download prompts.
c.prompt.filebrowser = True

# The rounding radius for the edges of prompts.
c.prompt.radius = 8

# Additional arguments to pass to Qt, without leading --.
c.qt.args = c.qt.args

# Another now option that I don't need
c.qt.highdpi = c.qt.highdpi

# When to use Chromium's low-end device mode
c.qt.low_end_device_mode = "auto"

# Which Chromium process model to use
c.qt.process_model = "process-per-site-instance"

# Force a Qt platform to use.
c.qt.force_platform = c.qt.force_platform

# Force software rendering for QtWebEngine.
c.qt.force_software_rendering = "none"

# Show a scrollbar.
c.scrolling.bar = "never"

# Enable smooth scrolling for web pages.
c.scrolling.smooth = False

# Ignore case in search
c.search.ignore_case = "smart"

# The name of the session to save by default.
c.session.default_name = "default"

# Don't load all the webpages after session restore
c.session.lazy_restore = True

# Spell checking languages.
c.spellcheck.languages = ["en-US", "ru-RU", "it-IT"]

# Hide the statusbar unless a message is shown.
c.statusbar.show = "always"

# Padding for the statusbar.
for key in ("top", "bottom", "left", "right"):
    c.statusbar.padding[key] = 0

# The position of the status bar.
c.statusbar.position = "bottom"

# Statusbar widgets. Need only url and keypress
c.statusbar.widgets = ["keypress", "url"]

# Open new tabs (middleclick/ctrl+click) in the background.
c.tabs.background = False

# On which mouse button to close tabs.
c.tabs.close_mouse_button = "none"

# Scaling for favicons in the tab bar.
c.tabs.favicons.scale = 1.0

# Show favicons in the tab bar.
c.tabs.favicons.show = "always"

# Padding for tab indicators
for key in ("top", "bottom", "left", "right"):
    c.tabs.indicator.padding[key] = 0

# Behavior when the last tab is closed.
c.tabs.last_close = "blank"

# Maximum width (in pixels) of tabs (-1 for no maximum)
c.tabs.max_width = -1

# Minimum width (in pixels) of tabs (-1 for the default minimum size behavior).
c.tabs.min_width = c.tabs.min_width

# Switch between tabs using the mouse wheel.
c.tabs.mousewheel_switching = False

# How new tabs opened from another tab are positioned.
c.tabs.new_position.related = "next"

# How new tabs which aren’t opened from another tab are positioned.
c.tabs.new_position.unrelated = "last"

# Padding around text for tabs
for key in ("top", "bottom", "left", "right"):
    c.tabs.padding[key] = 0

# Another option that I don't need
c.tabs.mode_on_change = c.tabs.mode_on_change

# Shrink pinned tabs to the same size as normal
c.tabs.pinned.shrink = c.tabs.pinned.shrink

# The position of the tab bar.
c.tabs.position = "top"

# Which tab to select when the focused tab is removed.
c.tabs.select_on_remove = "last-used"

# When to show the tab bar.
c.tabs.show = "switching"

# Time to show the tab bar before hiding it when tabs.show is set to switching.
c.tabs.show_switching_delay = 2000

# Open a new window for every tab.
c.tabs.tabs_are_windows = False

# Alignment of the text inside of tabs.
c.tabs.title.alignment = "center"

# The format to use for the tab title.
c.tabs.title.format = "{index}{audio} {current_title}"

# The format to use for the tab title for pinned tabs. The same placeholders like for tabs.title.format are defined.
c.tabs.title.format_pinned = "{index}"

# The width of the tab bar if it’s vertical, in px or as percentage of the window.
c.tabs.width = "20%"

# Width of the progress indicator (0 to disable).
c.tabs.indicator.width = 0

# Whether to wrap when changing tabs.
c.tabs.wrap = True

# Whether to start a search when something else than a URL is entered.
c.url.auto_search = "naive"

# The page to open if :open -t/-b/-w is used without URL.
c.url.default_page = "about:blank"

# The URL segments where :navigate increment/decrement will search for a number.
c.url.incdec_segments = c.url.incdec_segments

# Open base URL of the searchengine if a searchengine shortcut is invoked without parameters.
c.url.open_base_url = True

# Definitions of search engines which can be used via the address bar.
my_searchengines = {
    'DEFAULT': 'https://ddg.co/lite/?q={}',
    'd'      : ('https://ddg.co/?q={}&kk=-1&kah=it-it&' +
                'kl=wt-wt&ks=m&kaj=m&kam=osm&kp=-2&kn=-1&kd=1&kw=s&' +
                'kak=-1&kax=-1&km=l'),
    'yt'     : 'https://www.youtube.com/results?search_query={}',
    'rt'     : 'https://rutracker.net/forum/tracker.php?nm={}',
    'gtr'    : 'https://translate.google.com/#view=home&op=translate&sl=auto&tl=ru&text={}',
    'gte'    : 'https://translate.google.com/#view=home&op=translate&sl=auto&tl=en&text={}',
    'gti'    : 'https://translate.google.com/#view=home&op=translate&sl=auto&tl=it&text={}',
    'sp'     : 'https://www.startpage.com/do/asearch?query={}&prf=4c27b3baec77a46344631f4164a09662',
    'sx'     : 'https://searx.be/?preferences=eJxtVcuO2zoM_ZrrjTFFH4uuvChaXNwBCkzRpN0KtEQrrCXRleRk3K8vnUSOMncWMSKaOjw8fFhDRsuRMHUWA0ZwjYNgZ7DYYXj4sWsca3DroYE5s2Y_OczYWWbrsCEvnmqK_Lx0-zhj4zEf2HTfnnb7JsGACSHqQ_e2yQf02HHSEJuIaXY5KQ4q4Ell6Lt_wSVsDJOSl-yOGDsGOb7haJvzrYeUFyHi2JJmg8fGUILeoVEYLAXJ4N2HDx-flTqSQU7_vP88kh4hJaX8nEiL4ciQlUqsCVzr0RCIcYFgUK5d8xeLJSvAkHJt1Fo_5GOFbik76JWiLIeIxpD4n_VY3yZEMyFGpQZyZ4ujPkJc2hUyUaqxBydM46u3t3A95X7WI-ZrxEsB2snB0no-SgUrZ7949CzBcoSQnBTZ1PES_gng7y1rmVZd2_VxjREWgJt6oG3iuYqSeVw4czrwCOHm57hPGd_EVFAmf_2XMsQ8rR1ThV7gwFwbeMIQceJ0007KTRDW25VIJxrJQIb67oXxxnCIiG3iIZ8gYmsoos4iy2sSruRvOWDkE91pNpjIq6VQOoCUc31cwYo6G70-G7L2dmGI4GFtgqLu75OkVIcoEIVEQdhI5cVzcNLrd8QihZFAV6FfFKYwmEOSXNOh8rzoVRy2gdkENMa2BgcKlInDXdPW6sE0pVdgttQhriWWWT9jzgbDXd7T2HqKkYuWL_jf2JDOf_g-fc-_EMfa0lOw9bnM5jX8u-f_5b8dKdTdg5nZpdcqVBIr0FXwa802kNsolzKWSy_20DqAdMT2fjVYSS6TxzJMVynLssZwvwKNrIj1ZyufbU9Obhav1P0k_-BoRHXgPOKysnySmVOftEYp25enR1nCp0gZ5c1jOFcfVdKRnSu-lxWupBnHbY_3MjRJMpV9njZmJejuvGFWV3355iwqoZN5FMQdukFJII4ezn0mtv_2-2-7isc-gmy_qH58_ypW2XgYG-kTFOi_m0eMQg==&q={}',
    'btd'    : 'https://www.btdig.com/search?q={}',
    'sc'     : 'https://soundcloud.com/search?q={}',
    'gth'    : 'https://github.com/search?utf8=%E2%9C%93&q={}&type=',
}

for key, val in my_searchengines.items():
    c.url.searchengines[key] = val

# The page(s) to open at the start.
c.url.start_pages = "about:blank"

# The URL parameters to strip with :yank url.
c.url.yank_ignored_parameters = c.url.yank_ignored_parameters

# Hide the window decoration when using wayland (requires restart)
c.window.hide_decoration = False

# The format to use for the window title.
c.window.title_format = '{perc}({scroll_pos}){audio} {current_title}{title_sep}{current_url}'

# The default zoom level.
c.zoom.default = "150%"

# The available zoom levels.
c.zoom.levels = ["25%", "33%", "39%", "50%", "67%", "75%", "90%",
                 "100%", "110%", "125%", "150%", "175%", "200%",
                 "250%", "300%", "400%", "500%"]

# How much to divide the mouse wheel movements to translate them into zoom increments.
c.zoom.mouse_divider = 512

# Whether the zoom factor on a frame applies only to the text or to all content.
# c.zoom.text_only = # webkit only

# Keybindings
my_keys = {
    ',w'      : 'spawn --detach mpvi {url}',
    ',W'      : 'hint links spawn --detach mpvi {hint-url}',
    ',d'      : 'spawn --detach ytdli {url} {title}',
    ',D'      : 'hint links spawn --detach ytdli {hint-url}',
    ',a'      : 'spawn youtube_add_link "# {title} {url}"',
    ',A'      : 'hint links spawn youtube_add_link "# {hint-url}"',
    ',t'      : 'hint links spawn transmission-remote --add {hint-url}',
    'tjt'     : 'set content.javascript.enabled true',
    'tjf'     : 'set content.javascript.enabled false',
    'ge'      : 'emacs_source',
    '!'       : 'set-cmd-text :open !',
    '<Alt+!>' : 'set-cmd-text :open -t !',
}

for key, val in my_keys.items():
    config.bind(key, val)

# Per domain settings! Finally!
# with config.pattern(site) as p:
# p.content.javascript.enabled = True

js_sites = ["*://vk.com/*", "*://www.youtube.com/*",
            "*://www.trenord.it/*", "*://duckduckgo.com/*",
            "*://klava.org/*", "*://soundcloud.com/*",
            "*://rutracker.net/*", "*://translate.google.com/*",
            "*://doc.rust-lang.org/*", "*://crates.io/*",
            "*://mail.protonmail.com/*", "*://github.com/*"]

for site in js_sites:
    config.set('content.javascript.enabled', True, site)
