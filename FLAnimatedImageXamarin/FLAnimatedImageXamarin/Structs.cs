using System;
using ObjCRuntime;

namespace FLAnimatedImageXamarin
{
    [Native]
    public enum FLLogLevel : ulong
    {
        None = 0,
        Error,
        Warn,
        Info,
        Debug,
        Verbose
    }
}
