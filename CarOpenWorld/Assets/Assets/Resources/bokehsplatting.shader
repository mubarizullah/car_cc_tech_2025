Shader "Hidden/DepthOfField/BokehSplatting" {
	Properties {
		_MainTex ("", 2D) = "white" {}
		_BlurredColor ("", 2D) = "white" {}
		_FgCocMask ("", 2D) = "white" {}
	}
	SubShader {
		Pass {
			Blend DstAlpha One, Zero One
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 29203
			Program "vp" {
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 310 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					 struct pointBuffer_type {
						uint[7] value;
					};
					
					layout(std430, binding = 0) readonly buffer pointBuffer {
						pointBuffer_type pointBuffer_buf[];
					};
					layout(location = 0) out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					layout(location = 1) out highp float vs_TEXCOORD2;
					layout(location = 2) out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					void main()
					{
					    gl_Position.zw = vec2(0.0, 1.0);
					    u_xlat0.xyz = vec3(uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(0 >> 2) + 0]), uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(0 >> 2) + 1]), uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(0 >> 2) + 2]));
					    gl_Position.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.w = 0.0;
					    phase0_Output0_1.xyz = u_xlat0.wwz;
					    vs_TEXCOORD1 = vec4(uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(12 >> 2) + 0]), uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(12 >> 2) + 1]), uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(12 >> 2) + 2]), uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(12 >> 2) + 3]));
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD2 = phase0_Output0_1.z;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 310 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					layout(location = 0) in highp vec3 gs_TEXCOORD0;
					layout(location = 1) in highp vec4 gs_TEXCOORD1;
					layout(location = 2) in highp vec4 gs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bvec2 u_xlatb1;
					vec4 u_xlat2;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0.xy = (-gs_TEXCOORD2.xy) + vec2(1.0, 1.0);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    u_xlat0.xy = gs_TEXCOORD0.xy * gs_TEXCOORD2.xy + u_xlat0.xy;
					    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxy).xy;
					    u_xlatb1.xy = lessThan(u_xlat0.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
					    u_xlat2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlatb0 = u_xlatb6.y && u_xlatb1.y;
					    u_xlatb0 = u_xlatb0 && u_xlatb1.x;
					    u_xlatb0 = u_xlatb0 && u_xlatb6.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat1.xyz = gs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat2.w = gs_TEXCOORD0.z;
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef GEOMETRY
					#version 310 es
					#ifdef GL_ARB_geometry_shader
					#extension GL_ARB_geometry_shader : enable
					#endif
					#ifdef GL_OES_geometry_shader
					#extension GL_OES_geometry_shader : enable
					#endif
					#ifdef GL_EXT_geometry_shader
					#extension GL_EXT_geometry_shader : enable
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _BokehParams;
					uniform 	vec3 _Screen;
					layout(location = 0) in highp vec2 vs_TEXCOORD0 [1];
					layout(location = 1) in highp float vs_TEXCOORD2 [1];
					layout(location = 2) in highp vec4 vs_TEXCOORD1 [1];
					vec4 u_xlat0;
					float u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat5;
					layout(points) in;
					layout(triangle_strip) out;
					layout(location = 0) out highp vec3 gs_TEXCOORD0;
					layout(location = 1) out highp vec4 gs_TEXCOORD1;
					layout(location = 2) out highp vec4 gs_TEXCOORD2;
					layout(max_vertices = 4) out;
					void main()
					{
					    u_xlat0.z = float(0.0);
					    u_xlat0.w = float(0.0);
					    u_xlat1 = _BokehParams.w * vs_TEXCOORD1[0].w;
					    u_xlat1 = u_xlat1 * _BokehParams.x + 0.5;
					    u_xlat5 = floor(u_xlat1);
					    u_xlat1 = u_xlat1 * 2.0 + 1.0;
					    u_xlat5 = u_xlat5 * 2.0 + 3.0;
					    u_xlat2.xy = vec2(u_xlat5) * _Screen.xy;
					    u_xlat5 = u_xlat5 / u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = _BokehParams.y / u_xlat1;
					    u_xlat3 = vec4(u_xlat1) * vs_TEXCOORD1[0];
					    u_xlat0.xy = u_xlat2.xy * vec2(-1.0, 1.0);
					    u_xlat0 = u_xlat0 + gl_in[0].gl_Position;
					    gl_Position = u_xlat0;
					    gs_TEXCOORD0.xy = vec2(0.0, 1.0);
					    gs_TEXCOORD0.z = vs_TEXCOORD2[0];
					    gs_TEXCOORD1 = u_xlat3;
					    gs_TEXCOORD2.xy = vec2(u_xlat5);
					    gs_TEXCOORD2.zw = vec2(0.0, 0.0);
					    EmitVertex();
					    u_xlat2.z = 0.0;
					    u_xlat0 = u_xlat2.xyzz + gl_in[0].gl_Position;
					    gl_Position = u_xlat0;
					    gs_TEXCOORD0.xy = vec2(1.0, 1.0);
					    gs_TEXCOORD0.z = vs_TEXCOORD2[0];
					    gs_TEXCOORD1 = u_xlat3;
					    gs_TEXCOORD2.xy = vec2(u_xlat5);
					    gs_TEXCOORD2.zw = vec2(0.0, 0.0);
					    EmitVertex();
					    u_xlat0 = u_xlat2.xyzz * vec4(-1.0, -1.0, 1.0, 1.0) + gl_in[0].gl_Position;
					    gl_Position = u_xlat0;
					    gs_TEXCOORD0.xy = vec2(0.0, 0.0);
					    gs_TEXCOORD0.z = vs_TEXCOORD2[0];
					    gs_TEXCOORD1 = u_xlat3;
					    gs_TEXCOORD2.xy = vec2(u_xlat5);
					    gs_TEXCOORD2.zw = vec2(0.0, 0.0);
					    EmitVertex();
					    u_xlat2.w = (-u_xlat2.y);
					    u_xlat0 = u_xlat2.xwzz + gl_in[0].gl_Position;
					    gl_Position = u_xlat0;
					    gs_TEXCOORD0.xy = vec2(1.0, 0.0);
					    gs_TEXCOORD0.z = vs_TEXCOORD2[0];
					    gs_TEXCOORD1 = u_xlat3;
					    gs_TEXCOORD2.xy = vec2(u_xlat5);
					    gs_TEXCOORD2.zw = vec2(0.0, 0.0);
					    EmitVertex();
					    EndPrimitive();
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 310 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					 struct pointBuffer_type {
						uint[7] value;
					};
					
					layout(std430, binding = 0) readonly buffer pointBuffer {
						pointBuffer_type pointBuffer_buf[];
					};
					layout(location = 0) out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					layout(location = 1) out highp float vs_TEXCOORD2;
					layout(location = 2) out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					void main()
					{
					    gl_Position.zw = vec2(0.0, 1.0);
					    u_xlat0.xyz = vec3(uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(0 >> 2) + 0]), uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(0 >> 2) + 1]), uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(0 >> 2) + 2]));
					    gl_Position.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.w = 0.0;
					    phase0_Output0_1.xyz = u_xlat0.wwz;
					    vs_TEXCOORD1 = vec4(uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(12 >> 2) + 0]), uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(12 >> 2) + 1]), uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(12 >> 2) + 2]), uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(12 >> 2) + 3]));
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD2 = phase0_Output0_1.z;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 310 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					layout(location = 0) in highp vec3 gs_TEXCOORD0;
					layout(location = 1) in highp vec4 gs_TEXCOORD1;
					layout(location = 2) in highp vec4 gs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bvec2 u_xlatb1;
					vec4 u_xlat2;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0.xy = (-gs_TEXCOORD2.xy) + vec2(1.0, 1.0);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    u_xlat0.xy = gs_TEXCOORD0.xy * gs_TEXCOORD2.xy + u_xlat0.xy;
					    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxy).xy;
					    u_xlatb1.xy = lessThan(u_xlat0.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
					    u_xlat2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlatb0 = u_xlatb6.y && u_xlatb1.y;
					    u_xlatb0 = u_xlatb0 && u_xlatb1.x;
					    u_xlatb0 = u_xlatb0 && u_xlatb6.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat1.xyz = gs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat2.w = gs_TEXCOORD0.z;
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef GEOMETRY
					#version 310 es
					#ifdef GL_ARB_geometry_shader
					#extension GL_ARB_geometry_shader : enable
					#endif
					#ifdef GL_OES_geometry_shader
					#extension GL_OES_geometry_shader : enable
					#endif
					#ifdef GL_EXT_geometry_shader
					#extension GL_EXT_geometry_shader : enable
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _BokehParams;
					uniform 	vec3 _Screen;
					layout(location = 0) in highp vec2 vs_TEXCOORD0 [1];
					layout(location = 1) in highp float vs_TEXCOORD2 [1];
					layout(location = 2) in highp vec4 vs_TEXCOORD1 [1];
					vec4 u_xlat0;
					float u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat5;
					layout(points) in;
					layout(triangle_strip) out;
					layout(location = 0) out highp vec3 gs_TEXCOORD0;
					layout(location = 1) out highp vec4 gs_TEXCOORD1;
					layout(location = 2) out highp vec4 gs_TEXCOORD2;
					layout(max_vertices = 4) out;
					void main()
					{
					    u_xlat0.z = float(0.0);
					    u_xlat0.w = float(0.0);
					    u_xlat1 = _BokehParams.w * vs_TEXCOORD1[0].w;
					    u_xlat1 = u_xlat1 * _BokehParams.x + 0.5;
					    u_xlat5 = floor(u_xlat1);
					    u_xlat1 = u_xlat1 * 2.0 + 1.0;
					    u_xlat5 = u_xlat5 * 2.0 + 3.0;
					    u_xlat2.xy = vec2(u_xlat5) * _Screen.xy;
					    u_xlat5 = u_xlat5 / u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = _BokehParams.y / u_xlat1;
					    u_xlat3 = vec4(u_xlat1) * vs_TEXCOORD1[0];
					    u_xlat0.xy = u_xlat2.xy * vec2(-1.0, 1.0);
					    u_xlat0 = u_xlat0 + gl_in[0].gl_Position;
					    gl_Position = u_xlat0;
					    gs_TEXCOORD0.xy = vec2(0.0, 1.0);
					    gs_TEXCOORD0.z = vs_TEXCOORD2[0];
					    gs_TEXCOORD1 = u_xlat3;
					    gs_TEXCOORD2.xy = vec2(u_xlat5);
					    gs_TEXCOORD2.zw = vec2(0.0, 0.0);
					    EmitVertex();
					    u_xlat2.z = 0.0;
					    u_xlat0 = u_xlat2.xyzz + gl_in[0].gl_Position;
					    gl_Position = u_xlat0;
					    gs_TEXCOORD0.xy = vec2(1.0, 1.0);
					    gs_TEXCOORD0.z = vs_TEXCOORD2[0];
					    gs_TEXCOORD1 = u_xlat3;
					    gs_TEXCOORD2.xy = vec2(u_xlat5);
					    gs_TEXCOORD2.zw = vec2(0.0, 0.0);
					    EmitVertex();
					    u_xlat0 = u_xlat2.xyzz * vec4(-1.0, -1.0, 1.0, 1.0) + gl_in[0].gl_Position;
					    gl_Position = u_xlat0;
					    gs_TEXCOORD0.xy = vec2(0.0, 0.0);
					    gs_TEXCOORD0.z = vs_TEXCOORD2[0];
					    gs_TEXCOORD1 = u_xlat3;
					    gs_TEXCOORD2.xy = vec2(u_xlat5);
					    gs_TEXCOORD2.zw = vec2(0.0, 0.0);
					    EmitVertex();
					    u_xlat2.w = (-u_xlat2.y);
					    u_xlat0 = u_xlat2.xwzz + gl_in[0].gl_Position;
					    gl_Position = u_xlat0;
					    gs_TEXCOORD0.xy = vec2(1.0, 0.0);
					    gs_TEXCOORD0.z = vs_TEXCOORD2[0];
					    gs_TEXCOORD1 = u_xlat3;
					    gs_TEXCOORD2.xy = vec2(u_xlat5);
					    gs_TEXCOORD2.zw = vec2(0.0, 0.0);
					    EmitVertex();
					    EndPrimitive();
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 310 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					 struct pointBuffer_type {
						uint[7] value;
					};
					
					layout(std430, binding = 0) readonly buffer pointBuffer {
						pointBuffer_type pointBuffer_buf[];
					};
					layout(location = 0) out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					layout(location = 1) out highp float vs_TEXCOORD2;
					layout(location = 2) out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					void main()
					{
					    gl_Position.zw = vec2(0.0, 1.0);
					    u_xlat0.xyz = vec3(uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(0 >> 2) + 0]), uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(0 >> 2) + 1]), uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(0 >> 2) + 2]));
					    gl_Position.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.w = 0.0;
					    phase0_Output0_1.xyz = u_xlat0.wwz;
					    vs_TEXCOORD1 = vec4(uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(12 >> 2) + 0]), uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(12 >> 2) + 1]), uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(12 >> 2) + 2]), uintBitsToFloat(pointBuffer_buf[gl_VertexID].value[(12 >> 2) + 3]));
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD2 = phase0_Output0_1.z;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 310 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					layout(location = 0) in highp vec3 gs_TEXCOORD0;
					layout(location = 1) in highp vec4 gs_TEXCOORD1;
					layout(location = 2) in highp vec4 gs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bvec2 u_xlatb1;
					vec4 u_xlat2;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0.xy = (-gs_TEXCOORD2.xy) + vec2(1.0, 1.0);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    u_xlat0.xy = gs_TEXCOORD0.xy * gs_TEXCOORD2.xy + u_xlat0.xy;
					    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxy).xy;
					    u_xlatb1.xy = lessThan(u_xlat0.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
					    u_xlat2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlatb0 = u_xlatb6.y && u_xlatb1.y;
					    u_xlatb0 = u_xlatb0 && u_xlatb1.x;
					    u_xlatb0 = u_xlatb0 && u_xlatb6.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat1.xyz = gs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat2.w = gs_TEXCOORD0.z;
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef GEOMETRY
					#version 310 es
					#ifdef GL_ARB_geometry_shader
					#extension GL_ARB_geometry_shader : enable
					#endif
					#ifdef GL_OES_geometry_shader
					#extension GL_OES_geometry_shader : enable
					#endif
					#ifdef GL_EXT_geometry_shader
					#extension GL_EXT_geometry_shader : enable
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _BokehParams;
					uniform 	vec3 _Screen;
					layout(location = 0) in highp vec2 vs_TEXCOORD0 [1];
					layout(location = 1) in highp float vs_TEXCOORD2 [1];
					layout(location = 2) in highp vec4 vs_TEXCOORD1 [1];
					vec4 u_xlat0;
					float u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat5;
					layout(points) in;
					layout(triangle_strip) out;
					layout(location = 0) out highp vec3 gs_TEXCOORD0;
					layout(location = 1) out highp vec4 gs_TEXCOORD1;
					layout(location = 2) out highp vec4 gs_TEXCOORD2;
					layout(max_vertices = 4) out;
					void main()
					{
					    u_xlat0.z = float(0.0);
					    u_xlat0.w = float(0.0);
					    u_xlat1 = _BokehParams.w * vs_TEXCOORD1[0].w;
					    u_xlat1 = u_xlat1 * _BokehParams.x + 0.5;
					    u_xlat5 = floor(u_xlat1);
					    u_xlat1 = u_xlat1 * 2.0 + 1.0;
					    u_xlat5 = u_xlat5 * 2.0 + 3.0;
					    u_xlat2.xy = vec2(u_xlat5) * _Screen.xy;
					    u_xlat5 = u_xlat5 / u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = _BokehParams.y / u_xlat1;
					    u_xlat3 = vec4(u_xlat1) * vs_TEXCOORD1[0];
					    u_xlat0.xy = u_xlat2.xy * vec2(-1.0, 1.0);
					    u_xlat0 = u_xlat0 + gl_in[0].gl_Position;
					    gl_Position = u_xlat0;
					    gs_TEXCOORD0.xy = vec2(0.0, 1.0);
					    gs_TEXCOORD0.z = vs_TEXCOORD2[0];
					    gs_TEXCOORD1 = u_xlat3;
					    gs_TEXCOORD2.xy = vec2(u_xlat5);
					    gs_TEXCOORD2.zw = vec2(0.0, 0.0);
					    EmitVertex();
					    u_xlat2.z = 0.0;
					    u_xlat0 = u_xlat2.xyzz + gl_in[0].gl_Position;
					    gl_Position = u_xlat0;
					    gs_TEXCOORD0.xy = vec2(1.0, 1.0);
					    gs_TEXCOORD0.z = vs_TEXCOORD2[0];
					    gs_TEXCOORD1 = u_xlat3;
					    gs_TEXCOORD2.xy = vec2(u_xlat5);
					    gs_TEXCOORD2.zw = vec2(0.0, 0.0);
					    EmitVertex();
					    u_xlat0 = u_xlat2.xyzz * vec4(-1.0, -1.0, 1.0, 1.0) + gl_in[0].gl_Position;
					    gl_Position = u_xlat0;
					    gs_TEXCOORD0.xy = vec2(0.0, 0.0);
					    gs_TEXCOORD0.z = vs_TEXCOORD2[0];
					    gs_TEXCOORD1 = u_xlat3;
					    gs_TEXCOORD2.xy = vec2(u_xlat5);
					    gs_TEXCOORD2.zw = vec2(0.0, 0.0);
					    EmitVertex();
					    u_xlat2.w = (-u_xlat2.y);
					    u_xlat0 = u_xlat2.xwzz + gl_in[0].gl_Position;
					    gl_Position = u_xlat0;
					    gs_TEXCOORD0.xy = vec2(1.0, 0.0);
					    gs_TEXCOORD0.z = vs_TEXCOORD2[0];
					    gs_TEXCOORD1 = u_xlat3;
					    gs_TEXCOORD2.xy = vec2(u_xlat5);
					    gs_TEXCOORD2.zw = vec2(0.0, 0.0);
					    EmitVertex();
					    EndPrimitive();
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3"
				}
			}
			Program "gp" {
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 115532
			Program "vp" {
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 310 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					layout(location = 1) out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					layout(location = 0) out highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 310 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _BokehParams;
					uniform 	float _SpawnHeuristic;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _BlurredColor;
					layout (binding = 0) uniform highp atomic_uint pointBufferOutput_counter;
					 struct pointBufferOutput_type {
						uint[7] value;
					};
					
					layout(std430, binding = 1) buffer pointBufferOutput {
						pointBufferOutput_type pointBufferOutput_buf[];
					};
					layout(location = 0) in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump float u_xlat16_2;
					float u_xlat3;
					mediump vec4 u_xlat16_3;
					uint u_xlatu3;
					bool u_xlatb3;
					vec4 u_xlat4;
					mediump float u_xlat16_7;
					bool u_xlatb8;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_1.w = abs(u_xlat16_0.w);
					    u_xlat16_2 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3 = texture(_BlurredColor, vs_TEXCOORD1.xy);
					    u_xlat16_7 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat3 = u_xlat16_1.w * _BokehParams.w;
					    u_xlatb3 = 1.0<u_xlat3;
					    u_xlatb8 = 0.100000001<abs(u_xlat16_3.w);
					    u_xlatb3 = u_xlatb8 && u_xlatb3;
					    u_xlatb8 = _BokehParams.z<u_xlat16_2;
					    u_xlatb3 = u_xlatb8 && u_xlatb3;
					    u_xlat16_2 = (-u_xlat16_7) + u_xlat16_2;
					    u_xlatb8 = _SpawnHeuristic<abs(u_xlat16_2);
					    u_xlatb3 = u_xlatb8 && u_xlatb3;
					    if(u_xlatb3){
					        u_xlat16_2 = min(u_xlat16_0.w, 0.0);
					        u_xlat16_7 = u_xlat16_1.w * 4.0;
					        u_xlat16_7 = min(u_xlat16_7, 1.0);
					        u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(u_xlat16_7);
					        u_xlatu3 = atomicCounterIncrement(pointBufferOutput_counter);
					        u_xlat4.xy = vs_TEXCOORD1.xy;
					        u_xlat4.z = (-u_xlat16_2);
					        u_xlat4.w = u_xlat16_1.x;
					        pointBufferOutput_buf[u_xlatu3].value[(0 >> 2)] = floatBitsToUint(u_xlat4.x);
					        pointBufferOutput_buf[u_xlatu3].value[(0 >> 2) + 1] = floatBitsToUint(u_xlat4.y);
					        pointBufferOutput_buf[u_xlatu3].value[(0 >> 2) + 2] = floatBitsToUint(u_xlat4.z);
					        pointBufferOutput_buf[u_xlatu3].value[(0 >> 2) + 3] = floatBitsToUint(u_xlat4.w);
					        pointBufferOutput_buf[u_xlatu3].value[(16 >> 2)] = floatBitsToUint(u_xlat16_1.y);
					        pointBufferOutput_buf[u_xlatu3].value[(16 >> 2) + 1] = floatBitsToUint(u_xlat16_1.z);
					        pointBufferOutput_buf[u_xlatu3].value[(16 >> 2) + 2] = floatBitsToUint(u_xlat16_1.w);
					        u_xlat16_1.x = (-u_xlat16_1.w) * 4.0 + 1.0;
					        u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
					        u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xxx;
					    } else {
					        u_xlat16_1.xyz = u_xlat16_0.xyz;
					    }
					    SV_Target0.xyz = u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat16_0.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 310 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					layout(location = 1) out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					layout(location = 0) out highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 310 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _BokehParams;
					uniform 	float _SpawnHeuristic;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _BlurredColor;
					layout (binding = 0) uniform highp atomic_uint pointBufferOutput_counter;
					 struct pointBufferOutput_type {
						uint[7] value;
					};
					
					layout(std430, binding = 1) buffer pointBufferOutput {
						pointBufferOutput_type pointBufferOutput_buf[];
					};
					layout(location = 0) in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump float u_xlat16_2;
					float u_xlat3;
					mediump vec4 u_xlat16_3;
					uint u_xlatu3;
					bool u_xlatb3;
					vec4 u_xlat4;
					mediump float u_xlat16_7;
					bool u_xlatb8;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_1.w = abs(u_xlat16_0.w);
					    u_xlat16_2 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3 = texture(_BlurredColor, vs_TEXCOORD1.xy);
					    u_xlat16_7 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat3 = u_xlat16_1.w * _BokehParams.w;
					    u_xlatb3 = 1.0<u_xlat3;
					    u_xlatb8 = 0.100000001<abs(u_xlat16_3.w);
					    u_xlatb3 = u_xlatb8 && u_xlatb3;
					    u_xlatb8 = _BokehParams.z<u_xlat16_2;
					    u_xlatb3 = u_xlatb8 && u_xlatb3;
					    u_xlat16_2 = (-u_xlat16_7) + u_xlat16_2;
					    u_xlatb8 = _SpawnHeuristic<abs(u_xlat16_2);
					    u_xlatb3 = u_xlatb8 && u_xlatb3;
					    if(u_xlatb3){
					        u_xlat16_2 = min(u_xlat16_0.w, 0.0);
					        u_xlat16_7 = u_xlat16_1.w * 4.0;
					        u_xlat16_7 = min(u_xlat16_7, 1.0);
					        u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(u_xlat16_7);
					        u_xlatu3 = atomicCounterIncrement(pointBufferOutput_counter);
					        u_xlat4.xy = vs_TEXCOORD1.xy;
					        u_xlat4.z = (-u_xlat16_2);
					        u_xlat4.w = u_xlat16_1.x;
					        pointBufferOutput_buf[u_xlatu3].value[(0 >> 2)] = floatBitsToUint(u_xlat4.x);
					        pointBufferOutput_buf[u_xlatu3].value[(0 >> 2) + 1] = floatBitsToUint(u_xlat4.y);
					        pointBufferOutput_buf[u_xlatu3].value[(0 >> 2) + 2] = floatBitsToUint(u_xlat4.z);
					        pointBufferOutput_buf[u_xlatu3].value[(0 >> 2) + 3] = floatBitsToUint(u_xlat4.w);
					        pointBufferOutput_buf[u_xlatu3].value[(16 >> 2)] = floatBitsToUint(u_xlat16_1.y);
					        pointBufferOutput_buf[u_xlatu3].value[(16 >> 2) + 1] = floatBitsToUint(u_xlat16_1.z);
					        pointBufferOutput_buf[u_xlatu3].value[(16 >> 2) + 2] = floatBitsToUint(u_xlat16_1.w);
					        u_xlat16_1.x = (-u_xlat16_1.w) * 4.0 + 1.0;
					        u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
					        u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xxx;
					    } else {
					        u_xlat16_1.xyz = u_xlat16_0.xyz;
					    }
					    SV_Target0.xyz = u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat16_0.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 310 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					layout(location = 1) out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					layout(location = 0) out highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 310 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _BokehParams;
					uniform 	float _SpawnHeuristic;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _BlurredColor;
					layout (binding = 0) uniform highp atomic_uint pointBufferOutput_counter;
					 struct pointBufferOutput_type {
						uint[7] value;
					};
					
					layout(std430, binding = 1) buffer pointBufferOutput {
						pointBufferOutput_type pointBufferOutput_buf[];
					};
					layout(location = 0) in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					mediump float u_xlat16_2;
					float u_xlat3;
					mediump vec4 u_xlat16_3;
					uint u_xlatu3;
					bool u_xlatb3;
					vec4 u_xlat4;
					mediump float u_xlat16_7;
					bool u_xlatb8;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_1.w = abs(u_xlat16_0.w);
					    u_xlat16_2 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3 = texture(_BlurredColor, vs_TEXCOORD1.xy);
					    u_xlat16_7 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat3 = u_xlat16_1.w * _BokehParams.w;
					    u_xlatb3 = 1.0<u_xlat3;
					    u_xlatb8 = 0.100000001<abs(u_xlat16_3.w);
					    u_xlatb3 = u_xlatb8 && u_xlatb3;
					    u_xlatb8 = _BokehParams.z<u_xlat16_2;
					    u_xlatb3 = u_xlatb8 && u_xlatb3;
					    u_xlat16_2 = (-u_xlat16_7) + u_xlat16_2;
					    u_xlatb8 = _SpawnHeuristic<abs(u_xlat16_2);
					    u_xlatb3 = u_xlatb8 && u_xlatb3;
					    if(u_xlatb3){
					        u_xlat16_2 = min(u_xlat16_0.w, 0.0);
					        u_xlat16_7 = u_xlat16_1.w * 4.0;
					        u_xlat16_7 = min(u_xlat16_7, 1.0);
					        u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(u_xlat16_7);
					        u_xlatu3 = atomicCounterIncrement(pointBufferOutput_counter);
					        u_xlat4.xy = vs_TEXCOORD1.xy;
					        u_xlat4.z = (-u_xlat16_2);
					        u_xlat4.w = u_xlat16_1.x;
					        pointBufferOutput_buf[u_xlatu3].value[(0 >> 2)] = floatBitsToUint(u_xlat4.x);
					        pointBufferOutput_buf[u_xlatu3].value[(0 >> 2) + 1] = floatBitsToUint(u_xlat4.y);
					        pointBufferOutput_buf[u_xlatu3].value[(0 >> 2) + 2] = floatBitsToUint(u_xlat4.z);
					        pointBufferOutput_buf[u_xlatu3].value[(0 >> 2) + 3] = floatBitsToUint(u_xlat4.w);
					        pointBufferOutput_buf[u_xlatu3].value[(16 >> 2)] = floatBitsToUint(u_xlat16_1.y);
					        pointBufferOutput_buf[u_xlatu3].value[(16 >> 2) + 1] = floatBitsToUint(u_xlat16_1.z);
					        pointBufferOutput_buf[u_xlatu3].value[(16 >> 2) + 2] = floatBitsToUint(u_xlat16_1.w);
					        u_xlat16_1.x = (-u_xlat16_1.w) * 4.0 + 1.0;
					        u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
					        u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xxx;
					    } else {
					        u_xlat16_1.xyz = u_xlat16_0.xyz;
					    }
					    SV_Target0.xyz = u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat16_0.w;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3"
				}
			}
		}
	}
}