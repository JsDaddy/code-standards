module.exports = {
  parser: '@typescript-eslint/parser',
  parserOptions: {
    project: 'tsconfig.json',
    sourceType: 'module',
  },
  plugins: ['@typescript-eslint/eslint-plugin'],
  extends: [
    'plugin:@typescript-eslint/recommended',
    'plugin:prettier/recommended',
  ],
  root: true,
  env: {
    node: true,
    jest: true,
  },
  ignorePatterns: ['.eslintrc.js', '**/migrations/*.ts'],
  rules: {
    '@typescript-eslint/typedef': [
      'error',
      {
        arrowParameter: true,
      },
    ],
    '@typescript-eslint/explicit-module-boundary-types': ['error'],
    '@typescript-eslint/no-explicit-any': ['error'],
    '@typescript-eslint/adjacent-overload-signatures': ['error'],
    '@typescript-eslint/explicit-function-return-type': ['error'],
    'no-console': ['warn'],
    '@typescript-eslint/explicit-member-accessibility': ['error'],
    '@typescript-eslint/no-duplicate-imports': ['error'],
    'no-unused-vars': 'off',
    '@typescript-eslint/no-unused-vars': ['error'],
    '@typescript-eslint/no-require-imports': ['error'],
    '@typescript-eslint/no-unnecessary-type-arguments': ['error'],
    '@typescript-eslint/non-nullable-type-assertion-style': ['error'],
    '@typescript-eslint/prefer-readonly': ['error'],
    '@typescript-eslint/no-unnecessary-type-constraint': ['error'],
    '@typescript-eslint/no-array-constructor': ['error'],
    '@typescript-eslint/no-invalid-void-type': ['error'],
  },
};
