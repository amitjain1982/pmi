package com.intelligrape.pmi

import com.intelligrape.pmi.enums.TemplateType

import java.util.regex.Matcher
import java.util.regex.Pattern

class EmailMessageTemplate {
    static final Pattern PARAMETER_KEY_PATTERN = Pattern.compile("\\{(.+?)\\}")

    TemplateType templateType
    String description
    String body
    String subject
    String fromEmail

    /**
     * If acceptsParameters = true then the body of this
     * message can be passed a Map of named parameters and
     * the renderBodyArgs
     */
    Boolean acceptsParameters

    /**
     * If acceptsParameters = true then the body of this
     * message must contain the requiredParameterNames
     * specified in the list.  Each parameter in requiredParameterNames
     * must be specified at least once.
     */
    List<String> requiredParameterNames

    static hasMany = [requiredParameterNames: String]

    static constraints = {
        requiredParameterNames nullable: true
        acceptsParameters nullable: true
        description nullable: true
    }

    String writeMessageOutput(Map replacements = null, boolean isBody = true) {
        if (this.acceptsParameters && !replacements) {
            throw new IllegalArgumentException("The method parameter replacements is null, " +
                    " but the SystemEmailMessage indicates that this instance acceptsParameters")
        }
        String postApplyParams = applyMapArgs(replacements, isBody)
        return postApplyParams
    }

    String applyMapArgs(Map replacements, boolean isBody = true) {
        String parser = isBody ? this.body : this.subject
        Matcher matcher = PARAMETER_KEY_PATTERN.matcher(parser);
        StringBuilder builder = new StringBuilder();
        int i = 0;
        while (matcher.find()) {
            String replacement = replacements.get(matcher.group(1));
            builder.append(parser.substring(i, matcher.start()));
            if (replacement == null) {
                builder.append("");  // append a null string
            } else {
                builder.append(replacement);
            }
            i = matcher.end();
        }
        builder.append(parser.substring(i, parser.length()));
        return builder.toString()
    }
}

////TODO:move into enums package
//enum TemplateType {
//    QUESTIONARE
//}
