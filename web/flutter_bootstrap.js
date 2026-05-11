{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    // 1. Engine Initializing
    const appRunner = await engineInitializer.initializeEngine();

    // 2. Running App
    await appRunner.runApp();

    // 3. أول ما الـ App يشتغل فعلياً، نشيل الـ Loader
    const loader = document.getElementById('loading');
    if (loader) {
      setTimeout(() => {
        loader.remove();
      }, 500);
    }
  }
});