module.exports = {
  config: {
    fontSize: 10,
    fontFamily: '"Fira Mono", "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    cursorShape: 'BLOCK',
    cursorBlink: false,
    css: '',
    termCSS: '',
    showHamburgerMenu: '',
    showWindowControls: '',
    padding: '12px 14px',
    shell: '',
    shellArgs: ['--login'],
    env: {},
    bell: false,
    copyOnSelect: true,
    hyperStatusLine: {
      footerTransparent: false,
    },
    termCSS: `
      x-screen {
        -webkit-font-smoothing: subpixel-antialiased !important;
      }
    `,
  },

  plugins: [
    'hyper-argon',
    'hyper-statusline'
  ]
};
