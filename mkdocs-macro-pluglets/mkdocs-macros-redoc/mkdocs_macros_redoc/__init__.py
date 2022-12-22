"""
Code
"""

def define_env(env):
    @env.macro
    def redoc(spec: str, fullscreen: bool = False, expand_default_server_variables: bool = False):
        return """<div class="redoc-container" spec-url="{spec}" fullscreen="{fullscreen}" expand-default-server-variables="{expand_default_server_variables}"></div>""".format(
            spec=spec, fullscreen=str(fullscreen).lower(), expand_default_server_variables=str(expand_default_server_variables).lower())
