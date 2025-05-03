export function eagerLoadControllersFrom(path, application) {
    const context = require.context(path, true, /_controller\.js$/);
    context.keys().forEach(key => {
      const identifier = key.replace(/^\.\//, "").replace(/_controller\.js$/, "");
      application.register(identifier, context(key).default);
    });
  }