package operations.test

import com.developmentontheedge.be5.databasemodel.util.DpsUtils
import com.developmentontheedge.be5.operation.Operation
import com.developmentontheedge.be5.operation.OperationResult
import com.developmentontheedge.be5.server.operations.support.GOperationSupport
import groovy.transform.TypeChecked

@TypeChecked
class TestReloadButtonOperation extends GOperationSupport implements Operation {
    @Override
    Object getParameters(Map<String, Object> presetValues) throws Exception {
        params.add {
            name = "addInput"
            EXTRA_ATTRS = [inputType: "Button"]
            value = "Add input"
            RELOAD_ON_CHANGE = true
            DISPLAY_NAME = "Add input"//work both variants
//            CSS_CLASSES = "col-lg-3"
        }
        params.add {
            name = "removeInput"
            EXTRA_ATTRS = [inputType: "Button"]
            value = "Remove input"
            RELOAD_ON_CHANGE = true
//            CSS_CLASSES = "col-lg-4"
        }

        int cntProps = presetValues.findAll { it.key.startsWith("prop_") }.size();
        if (presetValues._reloadControl_ == '/addInput') {
            cntProps++;
            for (int i = 0; i < cntProps; i++) {
                params.add {
                    name = "prop_${i + 1}"
                    DISPLAY_NAME = "Input ${i + 1}"
                }
            }
        }
        if (presetValues._reloadControl_ == '/removeInput') {
            cntProps--;
            for (int i = 0; i < cntProps; i++) {
                params.add {
                    name = "prop_${i + 1}"
                    DISPLAY_NAME = "Input ${i + 1}"
                }
            }
        }
        return DpsUtils.setValues(params, presetValues)
    }

    @Override
    void invoke(Object parameters) throws Exception {
        //validator.setError(params.getProperty("name"), "test error")
        setResult(OperationResult.finished("test message"))
    }
}
