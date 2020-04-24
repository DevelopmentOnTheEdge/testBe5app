package operations.test

import com.developmentontheedge.be5.databasemodel.util.DpsUtils
import com.developmentontheedge.be5.groovy.GDynamicPropertySetSupport
import com.developmentontheedge.be5.operation.Operation
import com.developmentontheedge.be5.server.operations.support.GOperationSupport
import groovy.transform.TypeChecked

@TypeChecked
class TestOperationInnerDps extends GOperationSupport implements Operation {
    @Override
    Object getParameters(Map<String, Object> presetValues) throws Exception {
        def params = new GDynamicPropertySetSupport()
        def innerDPS1 = new GDynamicPropertySetSupport()
        def innerParentDPS = new GDynamicPropertySetSupport()
        def innerDPS2 = new GDynamicPropertySetSupport()
        def innerDPS3 = new GDynamicPropertySetSupport()


        params.add { name = "prop1"; DISPLAY_NAME = "Property 1"; value = "val1" }
        params.add { name = "prop2"; DISPLAY_NAME = "Property 2"; value = new Date() }
        params.add {
            name = "prop3"; DISPLAY_NAME = "Property 3"; TYPE = Integer;
            TAG_LIST_ATTR = [1, 2, 3] as Integer[]
        }


        innerDPS1.add {
            name = "innerProp1Level1"; DISPLAY_NAME = "Inner property 1 level 1";
            value = "inner val1 level 1"
        }
        innerDPS1.add {
            name = "innerProp2Level1"; DISPLAY_NAME = "Inner property 2 level 1";
            value = "inner val2 level 1"
        }

        params.add { name = "parentProp1"; DISPLAY_NAME = "Parent property 1"; value = innerDPS1 }

        params.add { name = "parentProp2"; DISPLAY_NAME = "Parent property 2"; value = innerParentDPS }

        innerParentDPS.add { name = "parentProp1Level2"; DISPLAY_NAME = "Parent property 1 level 2"; value = innerDPS2 }
        innerParentDPS.add { name = "parentProp2Level2"; DISPLAY_NAME = "Parent property 2 level 2"; value = innerDPS3 }

//        innerDPS2.add { name = "innerProp1Level2"; DISPLAY_NAME = "Inner property 1 level 2"; TYPE = Integer; TAG_LIST_ATTR = [1, 2, 3] as Integer[] }
        innerDPS2.add {
            name = "innerProp1Level2"; DISPLAY_NAME = "Inner property 1 level 2";
            value = "inner parent 1 property 1 level2 val1"
        }
        innerDPS2.add {
            name = "innerProp2Level2"; DISPLAY_NAME = "Inner property 2 level 2";
            value = "inner parent 1 property 1 level2 val2"
        }

        innerDPS3.add {
            name = "innerProp1Level2"; DISPLAY_NAME = "Inner property 1 level 2";
            value = "inner parent 2 property 1 level2 val1"
        }
        innerDPS3.add {
            name = "innerProp2Level2"; DISPLAY_NAME = "Inner property 2 level 2";
//            value = "inner parent 2 property 2 level2 val1";
            TYPE = Integer; TAG_LIST_ATTR = [1, 2, 3] as Integer[]
        }
        innerDPS3.add {
            name = "innerProp3Level2"; DISPLAY_NAME = "Inner property 3 level 2";
            value = "inner parent 2 property 3 level2 val1"; value = new Date()
        }

        return DpsUtils.setValues(params, presetValues)
    }

    @Override
    void invoke(Object parameters) throws Exception {

    }
}
