// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.
const overlap = "rgba(0, 0, 0, .15)";

module.exports = {
  config: {
    // choose either `'stable'` for receiving highly polished,
    // or `'canary'` for less polished but more frequent updates
    updateChannel: 'stable',

    // default font size in pixels for all tabs
    fontSize: 16,

    // font family with optional fallbacks
    fontFamily: '"DroidSansMono Nerd Font", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    // default font weight: 'normal' or 'bold'
    fontWeight: 'normal',

    // font weight for bold characters: 'normal' or 'bold'
    fontWeightBold: 'bold',

    // line height as a relative unit
    lineHeight: 1.1,

    // letter spacing as a relative unit
    letterSpacing: 0,

    // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
    cursorShape: 'BLOCK',

    // set to `true` (without backticks and without quotes) for blinking cursor
    cursorBlink: false,

    // hyper-night-owl theme
    backgroundColor: "#011627",
    foregroundColor: "#d6deeb",
    borderColor: "rgba(126, 87, 194, 0.3)",
    // cursorColor: "#E436FF", // purple
    cursorColor: "#ff4301", // red-orange
    cursorAccentColor: "#ffffff",
    selectionColor: "rgba(248, 28, 229, 0.3)",
    colors: {
      black: "#011627",
      red: "#EF5350",
      green: "#22da6e",
      yellow: "#addb67",
      blue: "#82aaff",
      magenta: "#c792ea",
      cyan: "#21c7a8",
      white: "#ffffff",
      lightBlack: "#575656",
      lightRed: "#ef5350",
      lightGreen: "#22da6e",
      lightYellow: "#ffeb95",
      lightBlue: "#82aaff",
      lightMagenta: "#c792ea",
      lightCyan: "#7fdbca",
      lightWhite: "#ffffff"
    },


    // // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    // cursorColor: 'rgba(248,28,229,0.8)',
    //
    // // terminal text color under BLOCK cursor
    // cursorAccentColor: '#000',
    //
    // // color of the text
    // foregroundColor: '#fff',
    //
    // // terminal background color
    // // opacity is only supported on macOS
    // backgroundColor: '#000',
    //
    // // terminal selection color
    // selectionColor: 'rgba(248,28,229,0.3)',
    //
    // // border color (window, tabs)
    // borderColor: '#333',

    // custom CSS to embed in the main window
      css: `
      .hyper_main {
        border: none !important;
      }
      .header_header {
        background-color: ${overlap} !important;
      }
      .tabs_borderShim {
        border-color: transparent !important;
      }
      .tab_tab {
        border: 0;
        background-color: #010e1a;
        color: #5f7e97;
      }
      .tab_tab::before {
        background-color: #272B3B;
      }
      .tab_active {
        background-color: #0b2942;
        color: #d2dee7;
      }
      .tab_active::before {
        background-color: #262A39;
      }
      .tab_text {
        background-color: #010e1a;
        color: #5f7e97;
      }
      .tab_textActive {
        background-color: #0b2942;
        color: #d2dee7;
      }
      .hyper-search-wrapper {
          border: 0 !important;
          padding: 0 !important;
          background-color: transparent !important;
          display: flex;
          opacity: 0.8 !important;
        }
      .hyper-search-wrapper button {
        top: 0 !important;
        opacity: 0.8 !important;
        padding: 0 6px;
        cursor: pointer;
      }
      .hyper-search-wrapper button:hover {
        opacity: 1.0 !important;
      }
      .hyper-search-wrapper button:nth-of-type(1) {
        border-radius: 4px 0 0 4px !important;
        border-right: 1px solid #575656 !important;
      }
      .hyper-search-wrapper button:nth-of-type(2) {
        border-radius: 0 4px 4px 0 !important;
      }
      .hyper-search-wrapper:before {
        width: 20px;
        color: #000;
        position: absolute;
        content: "🔍";
        font-size: 10px;
        margin: 7px;
        z-index: 999;
      }
      #hyper-search-input {
        background-color: #ffffff !important;
        border-radius: 4px;
        box-shadow: 0 1px 10px rgba(0, 0, 0, 0.5);
        padding: 3px 6px 3px 24px !important;
        color: #011627 !important;
        opacity: 0.9 !important;
        margin-right: 2px;
      }
      #hyper-search-input:focus {
        opacity: 1.0 !important;
        box-shadow: 0 1px 10px rgba(0, 0, 0, 1.0);
      }
    `,

    // custom CSS to embed in the terminal window
    termCSS: '',

    // if you're using a Linux setup which show native menus, set to false
    // default: `true` on Linux, `true` on Windows, ignored on macOS
    showHamburgerMenu: '',

    // set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
    showWindowControls: '',

    // custom padding (CSS format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    // colors: {
    //   black: '#000000',
    //   red: '#C51E14',
    //   green: '#1DC121',
    //   yellow: '#C7C329',
    //   blue: '#0A2FC4',
    //   magenta: '#C839C5',
    //   cyan: '#20C5C6',
    //   white: '#C7C7C7',
    //   lightBlack: '#686868',
    //   lightRed: '#FD6F6B',
    //   lightGreen: '#67F86F',
    //   lightYellow: '#FFFA72',
    //   lightBlue: '#6A76FB',
    //   lightMagenta: '#FD7CFC',
    //   lightCyan: '#68FDFE',
    //   lightWhite: '#FFFFFF',
    // },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // PowerShell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
    // by default `['--login']` will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to `false` for no bell
    bell: false,

    // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
    defaultSSHApp: true,

    // if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
    // selection is present (`true` by default on Windows and disables the context menu feature)
    quickEdit: false,

    // choose either `'vertical'`, if you want the column mode when Option key is hold during selection (Default)
    // or `'force'`, if you want to force selection regardless of whether the terminal is in mouse events mode
    // (inside tmux or vim with mouse mode enabled for example).
    macOptionSelectionMode: 'vertical',

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // Whether to use the WebGL renderer. Set it to false to use canvas-based
    // rendering (slower, but supports transparent backgrounds)
    webGLRenderer: true,

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    "hypercwd",
    "hyperlinks",
    "hyper-pane",
    "hyper-active-tab",
    "hyper-search"
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  },

  // hyper-pane
  paneNavigation: {
    debug: false,
    hotkeys: {
      navigation: {
        up: 'ctrl+alt+up',
        down: 'ctrl+alt+down',
        left: 'ctrl+alt+left',
        right: 'ctrl+alt+right'
      },
      jump_prefix: 'ctrl+alt', // completed with 1-9 digits
      permutation_modifier: 'shift', // Added to jump and navigation hotkeys for pane permutation
      maximize: 'meta+enter'
    },
    showIndicators: true, // Show pane number
    indicatorPrefix: '^⌥', // Will be completed with pane number
    indicatorStyle: { // Added to indicator <div>
      position: 'absolute',
      top: 0,
      left: 0,
      fontSize: '10px'
    },
    focusOnMouseHover: false,
    inactivePaneOpacity: 0.6 // Set to 1 to disable inactive panes dimming
  },
};
