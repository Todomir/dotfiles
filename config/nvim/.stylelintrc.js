'use strict';

module.exports = {
  processors: ['stylelint-processor-styled-components'],
  extends: [
    'stylelint-config-standard',
    'stylelint-config-prettier',
    'stylelint-config-styled-components',
    'stylelint-config-rational-order'
  ],
  rules: {
    'plugin/rational-order': [
      true,
      {
        'empty-line-between-groups': true
      }
    ]
  }
};
