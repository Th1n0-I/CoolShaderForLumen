#version 330 compatibility

//out vec2 texcoord;

//void main() {
	//gl_Position = ftransform();
	//texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
//}

out vec2 lmcoord;
out vec2 texcoord;
out vec4 glcolor;
out vec3 normal;

uniform mat4 gbufferModelViewInverse;
uniform mat4 gbufferModelView;

void main() {
	vec4 worldPos = gbufferModelViewInverse * (gl_ModelViewMatrix * gl_Vertex);

	worldPos.y += pow(worldPos.x * worldPos.x, 0.7) * 0.1;

	vec4 viewPos = gbufferModelView * worldPos;

	gl_Position = gl_ProjectionMatrix *  viewPos;
	texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
	lmcoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
	glcolor = gl_Color;

	normal = gl_NormalMatrix * gl_Normal;
	normal = mat3(gbufferModelViewInverse) * normal;
}