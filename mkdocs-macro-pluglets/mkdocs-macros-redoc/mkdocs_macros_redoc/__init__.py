"""
Code
"""

def define_env(env):
    @env.macro
    def redoc(spec: str, fullscreen: bool = False):
        return """<div class="redoc-container" spec-url="{spec}" fullscreen="{fullscreen}"></div>""".format(
            spec=spec, fullscreen=str(fullscreen).lower())
