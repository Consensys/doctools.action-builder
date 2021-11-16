"""
Code
"""

def define_env(env):

    @env.macro
    def katacoda(scenario:str, color:str='213fa4', style:str='height: 600px;', hide_intro:bool=False, hide_finish:bool=False, id:int=1 ):
        code = """<div id="katacoda_{id}"
    data-katacoda-id="{scenario}"
    data-katacoda-hidefinish="{hide_finish}"
    data-katacoda-hideintro="{hide_intro}"
    data-katacoda-color="{color}"
    style="{style}"></div>""".format(
            scenario=scenario,
            color=color,
            style=style,
            hide_intro=str(hide_intro).lower(),
            hide_finish=str(hide_finish).lower(),
            id=id,
        )
        return code

