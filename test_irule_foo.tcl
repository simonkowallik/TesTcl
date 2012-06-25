source on.tcl
source assert.tcl
source onirule.tcl
namespace import ::testcl::on
namespace import ::testcl::unknown
namespace import ::testcl::endstate
namespace import ::testcl::assertString
namespace import ::testcl::assertNumber

# Comment out to suppress logging
log::lvSuppressLE info 0

event HTTP_REQUEST

on HTTP::uri return "/foo/admin"

endstate pool foo

set rc [catch {source irule.tcl} result]

assertString "rule irule" $result
assertNumber 0 $rc