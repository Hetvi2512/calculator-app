import reactPlugin from 'eslint-plugin-react';

export default [
  {
    files: ['src/**/*.{js,jsx}'], // Lint .js and .jsx files inside src/
    languageOptions: {
      ecmaVersion: 'latest',
      sourceType: 'module',
      parserOptions: {
        ecmaFeatures: {
          jsx: true,  // ✅ Enable JSX
        },
      },
      globals: {
        React: 'writable', // Required for older React versions
      },
    },
    plugins: {
      react: reactPlugin,  // ✅ Attach react plugin
    },
    rules: {
      'no-unused-vars': ['error', { args: 'none' }],
      'no-undef': 'error',
      'react/react-in-jsx-scope': 'off', // Turn off if using React 17+
    },
  },
];
