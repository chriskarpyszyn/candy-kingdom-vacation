Shader "Custom/GroundShader" {
    Properties {
        _TopColor ("Top Color", Color) = (1, 1, 1, 1)
        _BottomColor ("Bottom Color", Color) = (0, 0, 0, 1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Smoothness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _BumpMap ("Normal Map", 2D) = "bump" {}
        _BumpScale ("Bump Scale", Range(0,10)) = 1
        //_BumpDistance ("Bump Distance", Range(0,10)) = 0.2
    }

    SubShader {
        Tags {"Queue"="Transparent" "RenderType"="Transparent"}
        LOD 100

        CGPROGRAM
        #pragma surface surf Standard

        sampler2D _MainTex;
        sampler2D _BumpMap;
        float4 _TopColor;
        float4 _BottomColor;
        float _Glossiness;
        float _Smoothness;
        float _Metallic;
        float _BumpScale;
        //float _BumpDistance;

        struct Input {
            float2 uv_MainTex;
            float3 worldPos;
        };

        float noise(float2 uv) {
            return frac(sin(dot(uv, float2(12.9898, 78.233))) * 43758.5453);
        }

        void surf (Input IN, inout SurfaceOutputStandard o) {
            float gradientValue = IN.uv_MainTex.x;
            o.Albedo = lerp(_BottomColor.rgb, _TopColor.rgb, gradientValue);
            o.Metallic = _Metallic;
            o.Smoothness = _Smoothness;

            ////random bumpies, chatgpt trolling me with magic numbers
            //float bump = (noise(IN.worldPos.xz * _BumpDistance) - 0.5) * 2.0;
            //float3 normal = float3(bump * _BumpScale, bump * _BumpScale, 1.0);
            //normal.xy += bump * _BumpScale;
            //o.Normal = normalize(normal);

            o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_MainTex)) * _BumpScale;

            o.Alpha = 1.0;
        }
        ENDCG
    }
    FallBack "Diffuse"
}


        //_MainTex ("Albedo (RGB)", 2D) = "white" {}