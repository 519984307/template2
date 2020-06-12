include(../../qtproject.pri)

TEMPLATE  = subdirs
SUBDIRS =   \
    dllTest \
    aggregation \
    MyDllTest \
    DbcReader
#SUBDIRS =   \
#    aggregation \
#    extensionsystem \
#    utils

for(l, SUBDIRS) {
    QTC_LIB_DEPENDS =
    include($$l/$${l}_dependencies.pri)
    lv = $${l}.depends
    $$lv = $$QTC_LIB_DEPENDS
}
