// # Proxy Compiler 18.9.3-e21ac4-20181026

import Foundation
import SAPOData

internal class ESPMContainerMetadataParser {
    internal static let options: Int = (CSDLOption.allowCaseConflicts | CSDLOption.disableFacetWarnings | CSDLOption.disableNameValidation | CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = ESPMContainerMetadataParser.parse()

    static func parse() -> CSDLDocument {
        let parser: CSDLParser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = ESPMContainerMetadataParser.options
        let metadata: CSDLDocument = parser.parseInProxy(ESPMContainerMetadataText.xml, url: "ESPM")
        metadata.proxyVersion = "18.9.3-e21ac4-20181026"
        return metadata
    }
}
