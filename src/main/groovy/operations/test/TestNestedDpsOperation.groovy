package operations.test

import com.developmentontheedge.be5.databasemodel.util.DpsUtils
import com.developmentontheedge.be5.groovy.GDynamicPropertySetSupport
import com.developmentontheedge.be5.operation.Operation
import com.developmentontheedge.be5.server.operations.support.GOperationSupport
import com.developmentontheedge.be5.util.DateUtils
import com.developmentontheedge.beans.DynamicProperty
import com.developmentontheedge.beans.DynamicPropertySet
import groovy.transform.TypeChecked

@TypeChecked
class TestNestedDpsOperation extends GOperationSupport implements Operation {
    @Override
    Object getParameters(Map<String, Object> presetValues) throws Exception {
//        def params = new GDynamicPropertySetSupport()
        def nestedDPS1 = new GDynamicPropertySetSupport()
        def nestedDPS2 = new GDynamicPropertySetSupport()
        def nestedDPS3 = new GDynamicPropertySetSupport()


        params.add { /*GROUP_ID = "1"; GROUP_NAME = "GROUP NAME 1";*/ name = "prop1"; DISPLAY_NAME = "Property 1";
            value = "val1"
        }
        params.add { /*GROUP_ID = "1"; GROUP_NAME = "GROUP NAME 1";*/ name = "prop2"; DISPLAY_NAME = "Property 2";
            value = DateUtils.currentDate()
        }
        params.add {
            name = "prop3"; DISPLAY_NAME = "Property 3"; TYPE = Integer;
            TAG_LIST_ATTR = [1, 2, 3] as Integer[]; value = 2
        }

        params.add { name = "nestedProp1"; DISPLAY_NAME = "Nested DPS name 1 level 1"; value = nestedDPS1 }
        params.add { name = "nestedProp2"; DISPLAY_NAME = "Nested DPS name 2 level 2"; value = nestedDPS2 }

        nestedDPS1.add {
            name = "nestedProp1Level1"; DISPLAY_NAME = "Nested property 1 level 1";
            value = "nested prop1 val1 level 1"
        }
        nestedDPS1.add {
            name = "nestedProp2Level1"; DISPLAY_NAME = "Nested property 2 level 1";
            value = "nested prop1 val2 level 1"
        }


        nestedDPS2.add {
            name = "nestedProp1Level1"; DISPLAY_NAME = "Nested property 1 level 1";
            value = "nested prop1 val3 level 1"
        }

        nestedDPS2.add {
            name = "nestedProp2Level1"; DISPLAY_NAME = "Nested DPS name 2 level 1";
            value = nestedDPS3
        }
        nestedDPS3.add {
            name = "nestedProp1Level2"; DISPLAY_NAME = "Nested property 1 level 2";
            value = "nested prop1 val4 level 2"
        }

        nestedDPS3.add {
            name = "nestedProp2Level2"; DISPLAY_NAME = "Nested property 2 level 2";
            value = "nested prop1 val5 level 2"
        }

        nestedDPS3.add {
            name = "nestedProp3Level2"; DISPLAY_NAME = "Nested property 3 level 2";
            value = "nested prop1 val6 level 2"
        }

        nestedDPS2.add {
            name = "nestedProp3Level1"; DISPLAY_NAME = "Nested property 3 level 1";
            value = "nested prop3 val7 level 1"
        }

        nestedDPS2.add {
            name = "nestedProp4Level1"; DISPLAY_NAME = "Nested property 4 level 1";
            value = "nested prop4 val8 level 1"
        }

        params.add { name = "prop4"; DISPLAY_NAME = "Property 4"; value = DateUtils.currentDate() }
        return DpsUtils.setValues(params, presetValues)
    }

    @Override
    void invoke(Object parameters) throws Exception {
        StringBuilder result = new StringBuilder()
        String indent = ""
        makeResult(result, (DynamicPropertySet)parameters, indent)
        setResultFinished(result.toString())
    }

    static makeResult(StringBuilder result, DynamicPropertySet dps, String indent) {
        for (DynamicProperty dp : dps) {
            if (dp.value instanceof DynamicPropertySet) {
                result.append("${indent}<strong>${dp.displayName} -></strong><br/>")
                def space = "&nbsp;"
                indent += space * dp.displayName.length();
                makeResult(result, dp.value as DynamicPropertySet,indent)
                indent = indent.substring(space.length() * dp.displayName.length());
            } else {
                result.append("${indent}${dp.displayName} -> ${dp.value}<br/>")
            }
        }
    }
}
