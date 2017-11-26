module.exports = {
  config: {
    fontSize: 10,
    fontFamily: '"Fira Mono", "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    cursorShape: 'BEAM',
    cursorBlink: true,
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
    }
  },

  plugins: [
    'hyper-argon',
    'hyper-statusline'
  ]
};
