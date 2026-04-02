uniform mat4 gbufferModelViewInverse;
uniform mat4 gbufferModelView;

uniform mat4 gbufferProjectionInverse;
uniform mat4 gbufferProjection;


uniform vec3 cameraPosition;

vec3 getWorldPos(vec4 clipPos){
    vec4 viewPos = (gbufferProjectionInverse * clipPos);
    viewPos /= viewPos.w;
    vec3 feetPlayerPos = (gbufferModelViewInverse * vec4(viewPos.xyz, 1.0)).xyz;
    vec3 worldPos = feetPlayerPos + cameraPosition;
    return worldPos;
}

vec4 getClipPos(vec3 worldPos){
    vec3 feetPlayerPos = worldPos - cameraPosition;
    vec3 viewPos = (gbufferModelView * vec4(feetPlayerPos, 1.0)).xyz;
    vec4 clipPos = gbufferProjection * vec4(viewPos, 1.0);
    return clipPos;
}

